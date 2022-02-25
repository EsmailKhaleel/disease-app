import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/homePage.dart';
import 'package:first_app/screens/loginScreen.dart';
import 'package:first_app/screens/signupScreen.dart';
import 'package:first_app/services/provider/modelHud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHud>(
      create: (context) => ModelHud(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id:(context) => HomePage(),
        },
      ),
    );
  }
}
