import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/loginScreen.dart';
import 'package:first_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.email!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final authResult =await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
              } catch (e) {
                final snackBar = SnackBar(
                    content: Text(e.toString()),
                    duration: new Duration(seconds: 4),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            child: const Text(
              'Sign out',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
