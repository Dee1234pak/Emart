import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:world/auth/login.dart';
import 'package:world/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBdK9I_1pKWddIUXXIJKYZ-qKDsKFKNZ3k",
        authDomain: "world-47750.firebaseapp.com",
        projectId: "world-47750",
        storageBucket: "world-47750.appspot.com",
        messagingSenderId: "482118344793",
        appId: "1:482118344793:web:e6960120b4595eda06d148",
        measurementId: "G-NB74HGSBH9",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
      },
    );
  }
}
