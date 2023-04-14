import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';

logindecision() async {
  SharedPreferences sharedpref = await SharedPreferences.getInstance();
  String? spuserkey = sharedpref.getString('userkey');
  String? spusername = sharedpref.getString('username');

  if (spuserkey != null &&
      spusername != null &&
      spuserkey != '' &&
      spusername != '') {
    print(spuserkey);
    userkey = spuserkey;
    username = spusername;
    return '/home';
  } else {
    return '/login';
  }
}
