import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world/auth/login.dart';

class MinorAccidentScreen extends StatelessWidget {
  final User? user;

  const MinorAccidentScreen({Key? key, required this.user}) : super(key: key);

  Future<void> _makeEmergencyCall(String service) async {
    String phoneNumber;

    //making calls
    switch (service) {
      case 'Police':
        phoneNumber = '1010';
        break;
      case 'Crane':
        phoneNumber = '12324';
        break;
      case 'Ambulance':
        phoneNumber = '35352';
        break;
      case 'Fire Department':
        phoneNumber = '6464';
        break;
      default:
        phoneNumber = '1010'; //default.. call police
    }

    // it launch successful it initiates a phone call; otherwise, it's thrown that it could not launch the call
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to handle user logout
  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print('Logout successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  // UI starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minor Accident'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _handleLogout(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user?.displayName ?? 'User'),
              accountEmail: Text(user?.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user?.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                  style: const TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.displayName ?? 'User'}!'),
            const SizedBox(height: 20),
            const Text('Choose an emergency service:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeEmergencyCall('Police');
              },
              child: const Text('Call Police'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeEmergencyCall('Crane');
              },
              child: const Text('Call Crane'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeEmergencyCall('Ambulance');
              },
              child: const Text('Call Ambulance'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeEmergencyCall('Fire Department');
              },
              child: const Text('Call Fire Department'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
