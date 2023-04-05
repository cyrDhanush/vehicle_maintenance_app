import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_maintenance_app/services/firebase.dart';

class Authentication {
  createUser(String name, String email, String password) async {
    UserCredential user;
    try {
      user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      return e;
    }
    return user;
  }

  loginUser(String email, String password) async {
    UserCredential user;
    try {
      user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      return e;
    }
    return user;
    // print(user);
  }
}
