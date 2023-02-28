import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class scheduleShop extends StatefulWidget {
  const scheduleShop({Key? key}) : super(key: key);

  @override
  State<scheduleShop> createState() => _scheduleShopState();
}

class _scheduleShopState extends State<scheduleShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RECENT SHOPS',
                  style: subtitle,
                ),
                Icon(
                  Icons.more_horiz_rounded,
                  color: darktext,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
