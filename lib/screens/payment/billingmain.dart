import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentwidgets/paymentduesection.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentwidgets/paymenttiles.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/carcarousal.dart';

class billingMain extends StatefulWidget {
  const billingMain({Key? key}) : super(key: key);

  @override
  State<billingMain> createState() => _billingMainState();
}

class _billingMainState extends State<billingMain> {
  UserServices userServices = UserServices();
  List<String> carkeys = [];
  bool loaded = false;
  int currentpage = 0;
  void setcurrentpage(int page) {
    print(page);
    setState(() {
      currentpage = page;
    });
  }

  Future<QuerySnapshot> getcardata() async {
    QuerySnapshot data = await userServices.getcars();
    carkeys.clear();
    for (DocumentSnapshot snapshot in data.docs) {
      carkeys.add(snapshot.id.toString());
    }
    loaded = true;
    return data;
  }

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
        child: FutureBuilder(
          future: getcardata(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.size != 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 180,
                    child: carCarousal(
                      setCurrentpage: setcurrentpage,
                      items: [
                        for (DocumentSnapshot doc in snapshot.data!.docs)
                          buildVehiclecard(
                              carmaker: doc.get('carmaker'),
                              carmodel: doc.get('carmodel'))
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            paymentDueSection(
                              carkey: carkeys[currentpage],
                            ),
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
              );
            } else if (snapshot.hasData && snapshot.data!.size == 0) {
              return Center(
                child: Text(
                  'Please add Vehicle in DashBoard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darktext,
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
