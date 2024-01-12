import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:world/auth/login.dart';

class UserProfileScreen extends StatelessWidget {
  final User? user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  // Function to handle user logout
  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const MyLogin()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SaveSmart'),
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
            const Text('Choose an option:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Major Accident'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Minor Accident'),),
              if (user != null)
              ElevatedButton(
                onPressed: () {},
                child: const Text('Authenticated Action'),
              ),
          ],
        ),
      ),
    );
  }
}
