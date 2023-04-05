import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleshop.dart';
import 'package:vehicle_maintenance_app/widgets/carcarousal.dart';

class Dashboard extends StatefulWidget {
  final GlobalKey<ScaffoldState> mykey;
  const Dashboard({Key? key, required this.mykey}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalpages = 3;
  int currentpage = 0;
  void setCurrentpage(int page) {
    setState(() {
      currentpage = page;
    });
    print(currentpage.toString() + 'from dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.mykey.currentState?.openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: globalpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: carCarousal(
                setCurrentpage: setCurrentpage,
                items: [
                  buildVehiclecard(),
                  buildVehiclecard(),
                  buildVehiclecard(),
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

class scheduleAppointmentTile extends StatelessWidget {
  const scheduleAppointmentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: globalpadding),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => scheduleShop(
                        serviceModel: ServiceModel(),
                      )));
        },
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
                      iconMaker(
                        iconData: Icons.calendar_month,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
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

class iconMaker extends StatelessWidget {
  final IconData iconData;
  const iconMaker({Key? key, this.iconData = Icons.access_time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: darktext.withAlpha(30),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: darktext,
        size: 30,
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
                      iconMaker(
                        iconData: Icons.timelapse_rounded,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
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
                              iconMaker(
                                iconData: Icons.notifications_rounded,
                              ),
                              Positioned(
                                right: 3,
                                top: 3,
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
