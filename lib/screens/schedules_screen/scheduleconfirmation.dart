import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';

class scheduleConfirmation extends StatelessWidget {
  const scheduleConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.left_chevron,
            color: darktext,
          ),
        ),
        title: Text(
          "Schedule",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'IS EVERYTHING CORRECT?',
              style: subtitle,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              surfaceTintColor: Colors.white,
              elevation: 7,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "Oil Change at Jiffy Lube",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darktext,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        iconMaker(
                          iconData: CupertinoIcons.clock,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            'Monday, April 8 at 5:30 PM',
                            style: TextStyle(
                              fontSize: 13,
                              color: darktext.withAlpha(100),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        iconMaker(
                          iconData: Icons.location_on_outlined,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            'Jiffy Lube\n756, Barrington Road,\nHanover Park',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              color: darktext.withAlpha(100),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'CONTACT INFO',
              style: subtitle,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Andrew Fuller',
                          style: TextStyle(
                            color: maintheme,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: darktext,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '+91 1234567890',
                      style: TextStyle(
                        color: maintheme,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'themailid@gmail.com',
                      style: TextStyle(
                        color: maintheme,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: darktext,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  width: 0.5,
                  color: darktext,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Schedule appointment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
