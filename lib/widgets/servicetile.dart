import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class serviceTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const serviceTile({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: maintheme,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      documentSnapshot.get('servicename').toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle,
                    ),
                    Text(
                      'at ' + documentSnapshot.get('shopname').toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          documentSnapshot.get('servicedate').toString(),
                          style: TextStyle(
                            color: darktext,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          documentSnapshot.get('servicetime').toString(),
                          style: TextStyle(
                            color: darktext,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    '₹ ' + documentSnapshot.get('serviceprice').toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darktext,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  paidBadge(
                      paid: (documentSnapshot.get('paymentstatus').toString() ==
                              'pending')
                          ? (false)
                          : (true)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

paidBadge({bool paid = true}) {
  if (paid == true) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Paid',
          style: TextStyle(
            fontSize: 13,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  } else {
    {
      return Row(
        children: [
          Icon(
            Icons.not_interested_rounded,
            color: Colors.red,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Not Paid',
            style: TextStyle(
              fontSize: 13,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}
