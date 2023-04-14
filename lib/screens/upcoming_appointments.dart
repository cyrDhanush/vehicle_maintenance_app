import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/servicetile.dart';

class upcomingAppointmentScreen extends StatefulWidget {
  final String carkey;
  final String title;
  upcomingAppointmentScreen(
      {Key? key,
      this.carkey = 'IgoC6hm8VmVNKjlleTET',
      this.title = 'Upcoming Appointments'})
      : super(key: key);

  @override
  State<upcomingAppointmentScreen> createState() =>
      _upcomingAppointmentScreenState();
}

class _upcomingAppointmentScreenState extends State<upcomingAppointmentScreen> {
  int totalcost = 0;
  final UserServices userServices = UserServices();
  Future<List<DocumentSnapshot>> getdata() async {
    QuerySnapshot querySnapshot =
        await userServices.getunpaidservicewithcarkey(carkey: widget.carkey);
    List<DocumentSnapshot> documentsnapshots = [];
    totalcost = 0;
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      documentsnapshots.add(documentSnapshot);
      totalcost += int.parse(documentSnapshot.get('serviceprice').toString());
    }
    return documentsnapshots;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
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
          (widget.title == '') ? ("Upcoming Appointments") : (widget.title),
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.length != 0) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return serviceTile(
                            documentSnapshot: snapshot.data![i],
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Cost: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹ ' + totalcost.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/paymentscreen',
                              arguments: snapshot.data!,
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
                            'Pay All',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasData && snapshot.data!.length == 0) {
              return Center(
                child: Text(
                  'No Services Booked Yet!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darktext,
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
