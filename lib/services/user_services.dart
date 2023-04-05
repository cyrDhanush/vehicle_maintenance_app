import 'package:vehicle_maintenance_app/services/constants.dart';

class UserServices {
  addnewcar({required String carmaker, required String carmodel}) async {
    await userbase.doc(userkey).collection('cars').add({
      'carmaker': carmaker,
      'carmodel': carmodel,
    });
    print('Success');
  }
}
