import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:world/auth/minor_accident.dart';
import 'package:world/auth/login.dart';

class UserProfileScreen extends StatefulWidget {
  final User user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}


// boolean variable or logout functioning
class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isLive = true;
  String stream = 'http://192.168.3.62:81/stream';

  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyLogin()),
      );
    } catch (e) {

      print(e.toString());
    }
  }

  //show the user profile , name , email id , type of accident or live stream
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
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
              accountName: Text(widget.user.displayName ?? 'User'),
              accountEmail: Text(widget.user.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  widget.user.displayName?.substring(0, 1).toUpperCase() ?? 'U',
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
            Text('SaveSmart Welcomes You, ${widget.user.displayName ?? 'User'}!'),
            const SizedBox(height: 20),
            const Text('Choose an option:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MinorAccidentScreen(user: widget.user),
                  ),
                );
              },
              child: const Text('Major Accident'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MinorAccidentScreen(user: widget.user),
                  ),
                );
              },
              child: const Text('Minor Accident'),
            ),
            const SizedBox(height: 20),
            CustomMjpegPlayer(
              isLive: isLive,
              stream: stream,
              additionalProperty: 'YourCustomValue',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMjpegPlayer extends StatelessWidget {
  final bool isLive;
  final String stream;
  final String additionalProperty;

  const CustomMjpegPlayer({
    Key? key,
    required this.isLive,
    required this.stream,
    required this.additionalProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mjpeg(
      isLive: isLive,
      stream: stream,
    );
  }
}
