import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';

class PaymentServices {
  payforService(List<DocumentSnapshot> snapshots) async {
    for (DocumentSnapshot doc in snapshots) {
      await userbase.doc(userkey).collection('services').doc(doc.id).update({
        'paymentstatus': 'completed',
      });
    }
  }
}
