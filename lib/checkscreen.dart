import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';

class checkscreen extends StatefulWidget {
  const checkscreen({Key? key}) : super(key: key);

  @override
  State<checkscreen> createState() => _checkscreenState();
}

class _checkscreenState extends State<checkscreen> {
  UserServices userServices = UserServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            userServices.getunpaidservicetotal(carkey: 'IgoC6hm8VmVNKjlleTET');
          },
          child: Text("Click me"),
        ),
      ),
    );
  }
}
