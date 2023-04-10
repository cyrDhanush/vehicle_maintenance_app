import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/widgets/carcarousal.dart';

class billingMain extends StatelessWidget {
  const billingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          "Billing",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 180,
              child: carCarousal(
                items: [
                  // buildVehiclecard(),
                  // buildVehiclecard(),
                  // buildVehiclecard(),
                  // buildVehiclecard(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PAYMENT DUE',
                        style: subtitle.copyWith(
                          color: maintheme,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      PaynowTile(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'RECENT TRANSACTIONS',
                        style: subtitle.copyWith(
                          color: darktext,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      recentTransactionsTile(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('See all Transactions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class recentTransactionsTile extends StatelessWidget {
  const recentTransactionsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: maintheme,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'MIDAS',
                        style: TextStyle(
                          color: darktext,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'February 02, 2019',
                        style: TextStyle(
                          color: darktext.withAlpha(100),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        'Tires, Brakes',
                        style: TextStyle(
                          color: darktext.withAlpha(100),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$ 125',
                      style: TextStyle(
                        fontSize: 20,
                        color: maintheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: darktext,
                      size: 35,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: darktext.withAlpha(100),
        ),
      ],
    );
  }
}

class PaynowTile extends StatelessWidget {
  const PaynowTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      elevation: 7,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(15),
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
                    height: 7,
                  ),
                  Text(
                    'March 12, 2019',
                    style: TextStyle(
                      color: darktext.withAlpha(100),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Oil Change and Standard Checkup',
                    style: TextStyle(
                      color: darktext.withAlpha(100),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Total: \$65',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: maintheme,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
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
                    'Pay Now',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
