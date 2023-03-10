import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/data.dart';
import 'package:vehicle_maintenance_app/global.dart';

class addNewCar extends StatefulWidget {
  const addNewCar({Key? key}) : super(key: key);

  @override
  State<addNewCar> createState() => _addNewCarState();
}

class _addNewCarState extends State<addNewCar> {
  String? carmaker;
  String? carmodel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (carmaker == null) {
      carmaker = carMakers.keys.first;
      carmodel = carMakers[carmaker][0];
    }
  }

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
          "Add Vehicle",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_rounded,
              color: darktext,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Vehicle Photos',
              style: subtitle,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: maintheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(
                      width: 3,
                      color: darktext,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.add,
                      color: maintheme,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Vehicle Maker',
              style: subtitle,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: maintheme,
                ),
              ),
              child: DropdownButton(
                value: carmaker,
                alignment: AlignmentDirectional.centerStart,
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                style: TextStyle(
                  fontSize: 16,
                  color: darktext,
                ),
                underline: Container(),
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  size: 20,
                  color: darktext,
                ),
                items: [
                  for (String i in carMakers.keys)
                    DropdownMenuItem(
                      value: i,
                      child: Text(i),
                    ),
                ],
                onChanged: (a) {
                  setState(() {
                    carmaker = a;
                    carmodel = carMakers[carmaker][0];
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Vehicle Model',
              style: subtitle,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: maintheme,
                ),
              ),
              child: DropdownButton(
                value: carmodel,
                alignment: AlignmentDirectional.centerStart,
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                style: TextStyle(
                  fontSize: 16,
                  color: darktext,
                ),
                underline: Container(),
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  size: 20,
                  color: darktext,
                ),
                items: [
                  for (String i in carMakers[carmaker])
                    DropdownMenuItem(
                      value: i,
                      child: Text(i),
                    ),
                ],
                onChanged: (a) {
                  setState(() {
                    carmodel = a;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // OutlinedButton(
            //   onPressed: () {
            //     for (String i in carMakers.keys) {
            //       print(i);
            //     }
            //   },
            //   child: Text('Click Here'),
            // ),
          ],
        ),
      ),
    );
  }
}