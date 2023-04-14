import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

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
  final DocumentSnapshot snapshot;
  const PaynowTile({Key? key, required this.snapshot}) : super(key: key);

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
                    snapshot.get('shopname'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subtitle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    snapshot.get('servicedate'),
                    style: TextStyle(
                      color: darktext.withAlpha(100),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    snapshot.get('servicename'),
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
                  '₹ ' + snapshot.get('serviceprice').toString(),
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/paymentscreen',
                      arguments: [snapshot],
                    );
                  },
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
