import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';

class Dashboard extends StatefulWidget {
  final GlobalKey<ScaffoldState> mykey;
  const Dashboard({Key? key, required this.mykey}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalpages = 3;
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: globalpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 40,

                        //place holder
                        // color: Colors.blue,
                      ),
                      Text(
                        "DashBoard",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.mykey.currentState?.openEndDrawer();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Shops',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        shopcircle(),
                        shopcircle(),
                        shopcircle(),
                        shopcircle(),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                  //shop circles
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: PageView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          buildVehiclecard(),
                          buildVehiclecard(),
                          buildVehiclecard(),
                        ],
                        onPageChanged: (i) {
                          setState(() {
                            currentpage = i;
                          });
                        },
                      ),
                    ),
                  ),
                  //carousal view
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < totalpages; i++)
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: 7,
                              width: (i == currentpage) ? (20) : (7),
                              decoration: BoxDecoration(
                                color: (i == currentpage)
                                    ? (maintheme)
                                    : (Colors.grey.withAlpha(150)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      paymentTile(),
                      SizedBox(
                        height: 15,
                      ),
                      appointmentTile(),
                      SizedBox(
                        height: 15,
                      ),
                      scheduleAppointmentTile(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopcircle() {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: maintheme.withAlpha(50),
            width: 5,
          ),
        ),
      ),
    );
  }
}

class buildVehiclecard extends StatelessWidget {
  const buildVehiclecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/vehiclebg.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Toyota Prius 2013',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Mileage",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "134,571",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class scheduleAppointmentTile extends StatelessWidget {
  const scheduleAppointmentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: globalpadding),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: maintheme,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: maintheme.withAlpha(50),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.black.withAlpha(200),
                          size: 30,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SCHEDULE APPOINTMENT",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Time to give your car some love",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class appointmentTile extends StatelessWidget {
  const appointmentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: globalpadding),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: maintheme,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: maintheme.withAlpha(50),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.timelapse_rounded,
                          color: Colors.black.withAlpha(200),
                          size: 30,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "UPCOMING APPOINTMENTS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "You Have an Appointment at MIDAS in 3 days",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class paymentTile extends StatefulWidget {
  const paymentTile({Key? key}) : super(key: key);

  @override
  State<paymentTile> createState() => _paymentTileState();
}

class _paymentTileState extends State<paymentTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: globalpadding),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            expanded = !expanded;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: maintheme,
          padding: EdgeInsets.all(0),
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          height: (expanded) ? (180) : (100),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: maintheme.withAlpha(50),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.notifications_rounded,
                                  color: Colors.black.withAlpha(200),
                                  size: 30,
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Container(
                                  height: 7,
                                  width: 7,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "PAYMENTS DUE",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: (expanded)
                                        ? (Colors.black.withAlpha(100))
                                        : (Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                (expanded)
                                    ? (Text(
                                        'Total: 65\$ ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ))
                                    : (Text(
                                        "You have no payments due",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                expanded = !expanded;
                              });
                            },
                            icon: AnimatedRotation(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              turns: ((expanded) ? (1) : (0)) / 4,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ClipRect(
                  child: (expanded)
                      ? (Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Oil Change, standard checkup at Luffy Lube',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  'Review',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      : (Container()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
