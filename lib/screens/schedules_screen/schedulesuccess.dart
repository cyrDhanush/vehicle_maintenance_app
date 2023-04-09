import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class scheduleSuccess extends StatelessWidget {
  const scheduleSuccess({Key? key}) : super(key: key);

  final String t2 =
      "You'll receive a confirmation email from Jiffy Lube to confirm your requredted date and time.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          "Confirmation",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Thanks for Scheduling your next Service',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: darktext,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              t2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darktext,
                fontSize: 18,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: maintheme,
                side: BorderSide(
                  color: maintheme,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                  'Back to Dashboard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.car_crash_rounded,
              color: Colors.red,
              size: 70,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
