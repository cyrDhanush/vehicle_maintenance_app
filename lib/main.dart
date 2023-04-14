import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vehicle_maintenance_app/checkscreen.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/ongenerateroute.dart';
import 'package:vehicle_maintenance_app/screens/addnewcar.dart';
import 'package:vehicle_maintenance_app/screens/loginpage.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/payment/billingmain.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentscreen.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleappointment.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleconfirmation.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulereview.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleshop.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulesuccess.dart';
import 'package:vehicle_maintenance_app/screens/signup.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentsuccessfull.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_maintenance_app/screens/upcoming_appointments.dart';
import 'package:vehicle_maintenance_app/services/decision.dart';

String initialroute = '';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialroute = await logindecision();
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
      initialRoute: initialroute,
      // home: scheduleSuccess(),
      // initialRoute: '/cardselection',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: SignUp(),
      // home: homeParent(),
      // home: scheduleShop(
      //   serviceModel: ServiceModel(),
      // ),
      // home: addNewCar(),
      // home: scheduleShop(),
      // home: cardSelection(),
      // home: successfullScreen(),

      // home: upcomingAppointmentScreen(),
      // home: checkscreen(),
    );
  }
}
