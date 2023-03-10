import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/addnewcar.dart';
import 'package:vehicle_maintenance_app/screens/loginpage.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/payment/billingmain.dart';
import 'package:vehicle_maintenance_app/screens/payment/cardselection.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleappointment.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleconfirmation.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulereview.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleshop.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulesuccess.dart';
import 'package:vehicle_maintenance_app/screens/successfullscreen.dart';

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
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: maintheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.white,
            foregroundColor: maintheme,
          ),
        ),
      ),
      // home: LoginPage(),
      // home: homeParent(),
      home: addNewCar(),
      // home: cardSelection(),
      // home: successfullScreen(),
    );
  }
}
