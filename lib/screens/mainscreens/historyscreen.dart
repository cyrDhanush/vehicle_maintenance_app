import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';
import 'package:vehicle_maintenance_app/services/user_services.dart';
import 'package:vehicle_maintenance_app/widgets/servicetile.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key? key}) : super(key: key);

  @override
  State<historyScreen> createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  Map<String, List<DocumentSnapshot>> carservices = {};

  final UserServices userServices = UserServices();

  Future<Map<String, List<DocumentSnapshot>>> getdata() async {
    QuerySnapshot querySnapshot = await userServices.getserviceswithuserkey();
    carservices.clear();
    for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
      carservices.putIfAbsent(documentSnapshot.get('carkey'), () => []);
      carservices[documentSnapshot.get('carkey').toString()]
          ?.add(documentSnapshot);
    }
    return carservices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.length != 0) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15),
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return section(
                    carkey: snapshot.data!.keys.elementAt(i),
                    documentSnapshot: snapshot.data!.values.elementAt(i),
                  );
                },
              );
            } else if (snapshot.hasData && snapshot.data!.length == 0) {
              return Center(
                child: Text(
                  'No Service History Found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: darktext,
                  ),
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
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
        Column(
          children: [
            for (DocumentSnapshot ds in documentSnapshot)
              serviceTile(documentSnapshot: ds),
          ],
        ),
      ],
    );
  }
}
