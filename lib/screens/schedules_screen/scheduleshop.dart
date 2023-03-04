import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulereview.dart';

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
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  'RECENT SHOPS',
                  style: subtitle,
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz_rounded,
                  color: darktext,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    shopTile(),
                    shopTile(),
                    shopTile(),
                    shopTile(),
                    shopTile(),
                    shopTile(),
                    shopTile(),
                    SizedBox(
                      height: 20,
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

  Widget shopTile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => scheduleReview()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          // foregroundColor: maintheme,
          elevation: 2,
          surfaceTintColor: Colors.white,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jiffy Lube',
                      style: subtitle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReviewStar(
                      a: 3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '756, Barrington Road, Hanover Park 5245',
                      style: subtitle.copyWith(
                        fontSize: 12,
                        color: darktext.withAlpha(100),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: darktext,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
