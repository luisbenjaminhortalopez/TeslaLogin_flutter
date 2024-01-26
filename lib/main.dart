import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'screens/loginScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDOguBm7_W1cGKl5GKVkcVQ9Fu9Pb9OT7s", appId: "1:909932873535:web:72a8cfe2d389aca259758a", messagingSenderId: "1:909932873535:web:72a8cfe2d389aca259758a", projectId: "tesla-login-c2e18"));
  }
   await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
         debugShowCheckedModeBanner: false, 
    );
  }
}