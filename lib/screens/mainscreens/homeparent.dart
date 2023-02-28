import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/dashboard.dart';

class homeParent extends StatefulWidget {
  const homeParent({Key? key}) : super(key: key);

  @override
  State<homeParent> createState() => _homeParentState();
}

class _homeParentState extends State<homeParent> {
  int bottomindex = 2;
  double globalpadding = 15;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      // appBar: AppBar(),
      body: Dashboard(
        mykey: _globalKey,
      ),
      endDrawer: Drawer(
        backgroundColor: maintheme,
        width: 300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Card(
                      elevation: 7,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Andrew Fullter',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  draweritem(
                    title: 'Vehicle',
                    icon: Icons.car_crash_rounded,
                  ),
                  draweritem(
                    title: 'Settings',
                    icon: Icons.settings_rounded,
                  ),
                  draweritem(
                    title: 'Help',
                    icon: Icons.help_outline_rounded,
                  ),
                  draweritem(
                    title: 'About',
                    icon: Icons.info_outline_rounded,
                  ),
                  draweritem(
                    title: 'Invite',
                    icon: Icons.insert_invitation_rounded,
                  ),
                  draweritem(
                    title: 'Log Out',
                    icon: Icons.logout_rounded,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'VehiCare',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.car_crash_rounded,
                    color: Colors.red,
                    size: 60,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: maintheme,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomindex,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        iconSize: 25,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(150),
        onTap: (index) {
          setState(() {
            bottomindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_low),
            label: 'Billing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_rounded),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Messages',
          ),
        ],
      ),
    );
  }

  Widget draweritem({title = 'title', required IconData icon}) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8, left: 35),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}