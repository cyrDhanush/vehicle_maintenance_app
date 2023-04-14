import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/screens/addnewcar.dart';
import 'package:vehicle_maintenance_app/screens/loginpage.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentscreen.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleappointment.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleconfirmation.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulereview.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleshop.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulesuccess.dart';
import 'package:vehicle_maintenance_app/screens/signup.dart';
import 'package:vehicle_maintenance_app/screens/upcoming_appointments.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // main screens
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());

      case '/home':
        return MaterialPageRoute(builder: (_) => homeParent());

      //anonymous
      case '/addnewvehicle':
        return MaterialPageRoute(builder: (_) => addNewCar());

      case '/upcomingappointments':
        if (args is List) {
          return MaterialPageRoute(
              builder: (_) => upcomingAppointmentScreen(
                    carkey: args[0],
                    title: args[1],
                  ));
        } else
          return errorroute();

      //scheduling routes
      case '/scheduleshop':
        if (args is ServiceModel) {
          return MaterialPageRoute(
              builder: (_) => scheduleShop(serviceModel: args));
        } else
          return errorroute();
      case '/schedulereview':
        if (args is ServiceModel)
          return MaterialPageRoute(
              builder: (_) => scheduleReview(serviceModel: args));
        else
          return errorroute();
      case '/scheduleappointment':
        if (args is ServiceModel)
          return MaterialPageRoute(
              builder: (_) => scheduleAppointment(serviceModel: args));
        else
          return errorroute();
      case '/scheduleconfirmation':
        if (args is ServiceModel)
          return MaterialPageRoute(
              builder: (_) => scheduleConfirmation(serviceModel: args));
        else
          return errorroute();

      case '/schedulesuccess':
        return MaterialPageRoute(builder: (_) => scheduleSuccess());

      //payment screen routes
      case '/paymentscreen':
        if (args is List<DocumentSnapshot>)
          return MaterialPageRoute(
              builder: (_) => paymentScreen(
                    servicesnapshots: args,
                  ));
        else
          return errorroute();

      // default
      default:
        return errorroute();
    }
  }

  static Route errorroute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error Page"),
        ),
      );
    });
  }
}

// schedule order

// 1. schedule shop
// 2. schedule review
// 3. schedule appointment
// 4. schedule confirmation
// 5. schedule success
