import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';

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
    if (user.additionalUserInfo!.isNewUser) {
      userbase.doc(user.user!.uid.toString()).set({
        'name': name,
        'cars': {},
        'services': {},
      });
    }
    return true;
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
    // print(user.user!.uid.toString());

    return user;
    // print(user);
  }
}
