import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/data.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/models/shop_model.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/schedulereview.dart';

class scheduleShop extends StatefulWidget {
  final ServiceModel serviceModel;
  const scheduleShop({Key? key, required this.serviceModel}) : super(key: key);

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
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20),
                itemCount: shopdata.length,
                itemBuilder: (context, i) {
                  return shopTile(
                    shopmodel: shopdata[i],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopTile({required ShopModel shopmodel}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ElevatedButton(
        onPressed: () {
          widget.serviceModel.shopmodel = shopmodel;
          Navigator.pushNamed(context, '/schedulereview',
              arguments: widget.serviceModel);
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
                      // 'Jiffy Lube',
                      shopmodel.shopname,
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
                      // '756, Barrington Road, Hanover Park 5245',
                      shopmodel.shopaddress,
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
