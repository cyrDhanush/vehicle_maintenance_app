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

  Future<QuerySnapshot> getserviceswithuserkey() async {
    QuerySnapshot querySnapshot =
        await userbase.doc(userkey).collection('services').get();
    return querySnapshot;
  }

  Future<QuerySnapshot> getunpaidservicewithcarkey(
      {required String carkey}) async {
    QuerySnapshot querySnapshot = await userbase
        .doc(userkey)
        .collection('services')
        .where('carkey', isEqualTo: carkey)
        .where('paymentstatus', isEqualTo: 'pending')
        .get();
    return querySnapshot;
  }

  Future<QuerySnapshot> getunpaidservicewithuserkey() async {
    QuerySnapshot querySnapshot = await userbase
        .doc(userkey)
        .collection('services')
        .where('paymentstatus', isEqualTo: 'pending')
        .get();
    return querySnapshot;
  }

  deleteCar({required String carkey}) async {
    // to delete document from car collection
    await userbase.doc(userkey).collection('cars').doc(carkey).delete();
    print('user deleted');
    // to delete its services
    QuerySnapshot querySnapshot = await userbase
        .doc(userkey)
        .collection('services')
        .where('carkey', isEqualTo: carkey)
        .get();
    for (DocumentSnapshot doc in querySnapshot.docs) {
      await userbase.doc(userkey).collection('services').doc(doc.id).delete();
    }
    print('services deleted');
  }
}
