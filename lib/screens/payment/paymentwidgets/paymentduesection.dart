import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentwidgets/paymenttiles.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';

class paymentDueSection extends StatefulWidget {
  final String carkey;
  const paymentDueSection({Key? key, required this.carkey}) : super(key: key);

  @override
  State<paymentDueSection> createState() => _paymentDueSectionState();
}

class _paymentDueSectionState extends State<paymentDueSection> {
  UserServices userServices = UserServices();

  Future<QuerySnapshot> getdata() async {
    QuerySnapshot querySnapshot =
        await userServices.getunpaidservicewithcarkey(carkey: widget.carkey);
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.size == 0) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Wow, No payment due Left 😊',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, i) {
                  return PaynowTile(
                    snapshot: snapshot.data!.docs.elementAt(i),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
