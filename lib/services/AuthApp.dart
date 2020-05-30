import 'package:firebase_auth/firebase_auth.dart';

class AuthApp {
  final _auth = FirebaseAuth.instance;

  Future<AuthResult> SignUp(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }

  Future<AuthResult> Login(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }


}
