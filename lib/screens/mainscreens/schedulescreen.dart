import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/scheduletile.dart';

class scheduleScreen extends StatefulWidget {
  const scheduleScreen({Key? key}) : super(key: key);

  @override
  State<scheduleScreen> createState() => _scheduleScreenState();
}

class _scheduleScreenState extends State<scheduleScreen> {
  int totalcost = 0;
  Map<String, List<DocumentSnapshot>> carservices = {};
  final UserServices userServices = UserServices();
  Future<Map<String, List<DocumentSnapshot>>> getdata() async {
    QuerySnapshot querySnapshot =
        await userServices.getunpaidservicewithuserkey();
    totalcost = 0;
    carservices.clear();
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      carservices.putIfAbsent(documentSnapshot.get('carkey'), () => []);
      carservices[documentSnapshot.get('carkey').toString()]
          ?.add(documentSnapshot);

      totalcost += int.parse(documentSnapshot.get('serviceprice').toString());
    }
    print(carservices);
    return carservices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          "Schedules",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darktext,
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
                        padding: EdgeInsets.symmetric(vertical: 10),
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return section(
                              carkey: snapshot.data!.keys.elementAt(i),
                              documentSnapshot:
                                  snapshot.data!.values.elementAt(i));
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
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

  Widget section(
      {required String carkey,
      required List<DocumentSnapshot> documentSnapshot}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: FutureBuilder(
              future:
                  userbase.doc(userkey).collection('cars').doc(carkey).get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.get('carmaker') +
                        ' ' +
                        snapshot.data!.get('carmodel') +
                        ": ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: darktext,
                    ),
                  );
                } else
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 60,
                    child: LinearProgressIndicator(),
                  );
              }),
        ),
        // Flexible(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: documentSnapshot.length,
        //     itemBuilder: (context, i) {
        //       return scheduleTile(
        //         documentSnapshot: documentSnapshot[i],
        //       );
        //     },
        //   ),
        // ),
        Column(
          children: [
            for (DocumentSnapshot ds in documentSnapshot)
              scheduleTile(documentSnapshot: ds),
          ],
        ),
      ],
    );
  }
}
