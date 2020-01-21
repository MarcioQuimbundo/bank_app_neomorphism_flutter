import 'package:bank_app_neomorphism_flutter/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
