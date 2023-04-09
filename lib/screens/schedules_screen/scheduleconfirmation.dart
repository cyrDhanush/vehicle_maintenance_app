import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/commonvars.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulesuccess.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/loadingblock.dart';

class scheduleConfirmation extends StatelessWidget {
  final ServiceModel serviceModel;
  scheduleConfirmation({Key? key, required this.serviceModel})
      : super(key: key);
  final UserServices userServices = UserServices();
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
                      // "Oil Change at Jiffy Lube",
                      serviceModel.servicename! +
                          ' at ' +
                          serviceModel.shopmodel!.shopname,
                      textAlign: TextAlign.center,
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        iconMaker(
                          iconData: CupertinoIcons.clock,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            // 'Monday, April 8 at 5:30 PM',
                            months[int.parse(serviceModel.month!)] +
                                ' ' +
                                serviceModel.day +
                                ' at ' +
                                serviceModel.hours +
                                ':' +
                                serviceModel.minutes,
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        iconMaker(
                          iconData: Icons.location_on_outlined,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            // 'Jiffy Lube\n756, Barrington Road,\nHanover Park',
                            serviceModel.shopmodel!.shopname +
                                '\n' +
                                serviceModel.shopmodel!.shopaddress,
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
              onPressed: () async {
                loadingBlock(context: context);
                await userServices.addSchedule(serviceModel: serviceModel);
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  ModalRoute.withName('/'),
                );
                Navigator.pushNamed(context, '/schedulesuccess');
                // removing all from stack and
                // pushing home under schedule succes screen
              },
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
