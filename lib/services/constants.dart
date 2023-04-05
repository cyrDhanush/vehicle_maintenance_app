import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference userbase = firestore.collection('userdata');

const String userkey = '6QEiHxQ8MMeCWVyBoK8U0qHImvy2';
