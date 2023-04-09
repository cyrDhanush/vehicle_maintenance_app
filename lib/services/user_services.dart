import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';

class UserServices {
  addnewcar({required String carmaker, required String carmodel}) async {
    await userbase.doc(userkey).collection('cars').add({
      'carmaker': carmaker,
      'carmodel': carmodel,
    });
    print('Success');
  }

  addSchedule({required ServiceModel serviceModel}) async {
    var result = await userbase.doc(userkey).collection('services').add({
      'carkey': serviceModel.carkey,
      'shopname': serviceModel.shopmodel!.shopname,
      'servicename': serviceModel.servicename,
      'serviceprice': serviceModel.serviceprice.toString(),
      'servicedate': serviceModel.day.toString() +
          '/' +
          serviceModel.month.toString() +
          '/' +
          serviceModel.year.toString(),
      'servicetime':
          serviceModel.hours.toString() + ':' + serviceModel.minutes.toString(),
      'servicenotes': serviceModel.notes,
      'paymentstatus': serviceModel.paymentstatus,
    });
    return result;
  }

  Future<QuerySnapshot> getcars() async {
    QuerySnapshot querySnapshot =
        await userbase.doc(userkey).collection('cars').get();
    print(querySnapshot.docs);
    return querySnapshot;
  }

  Future<QuerySnapshot> getserviceswithcarkey({required String carkey}) async {
    QuerySnapshot snapshot = await userbase
        .doc(userkey)
        .collection('services')
        .where('carkey', isEqualTo: carkey)
        .get();
    return snapshot;
  }

  getunpaidservicetotal({required String carkey}) async {
    QuerySnapshot querySnapshot = await userbase
        .doc(userkey)
        .collection('services')
        .where('carkey', isEqualTo: carkey)
        .where('paymentstatus', isEqualTo: 'pending')
        .get();
    int totalcost = 0;
    for (DocumentSnapshot snapshot in querySnapshot.docs) {
      totalcost += int.parse(snapshot.get('serviceprice'));
    }
    return totalcost;
  }
}
