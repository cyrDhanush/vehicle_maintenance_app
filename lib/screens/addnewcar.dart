import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/data.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/loadingblock.dart';

class addNewCar extends StatefulWidget {
  const addNewCar({Key? key}) : super(key: key);

  @override
  State<addNewCar> createState() => _addNewCarState();
}

class _addNewCarState extends State<addNewCar> {
  String? carmaker;
  String? carmodel;
  UserServices userServices = UserServices();

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
            onPressed: () async {
              loadingBlock(context: context);
              await userServices.addnewcar(
                carmaker: carmaker!,
                carmodel: carmodel!,
              );
              Navigator.pop(context); // to pop dialog box
              print('Successfull');
            },
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

            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/vehicles/' + carPhotos[carmodel!].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Text(carmodel!),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: BorderRadius.circular(16),
              ),
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
