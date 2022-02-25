import 'package:firebase_auth/firebase_auth.dart';

class auth {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> Signup(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult ;
  }

   Future<UserCredential> Signin(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult ;
  }

}
