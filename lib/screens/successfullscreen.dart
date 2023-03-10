import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class successfullScreen extends StatelessWidget {
  const successfullScreen({Key? key}) : super(key: key);
  final String servicehead = "Thank you for Scheduling your Service.";
  final String servicedes =
      "You'll recieve a confirmation email from Jiffy Lube to confirm your requested date and time";
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
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              servicehead,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darktext,
              ),
            ),
            Text(
              servicedes,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: maintheme,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Back to Dashboard',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.car_crash_sharp,
              color: Colors.red,
              size: 80,
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
