import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/loginpage.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleshop.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'opensans',
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: maintheme,
      ),
      // home: LoginPage(),
      // home: homeParent(),
      home: scheduleShop(),
    );
  }
}
