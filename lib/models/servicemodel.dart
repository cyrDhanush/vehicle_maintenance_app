import 'package:vehicle_maintenance_app/models/shop_model.dart';

class ServiceModel {
  String? carkey;
  ShopModel? shopmodel;
  String? servicename;
  String? serviceprice;
  String? day;
  String? month;
  String? year;
  String? hours;
  String? minutes;
  String? notes;
  String? paymentstatus;

  ServiceModel({
    this.carkey,
    this.shopmodel,
    this.servicename,
    this.serviceprice,
    this.day,
    this.month,
    this.year,
    this.hours,
    this.minutes,
    this.notes = '',
    this.paymentstatus = 'pending',
  });

  void printer() {
    print(this.carkey);
    print(this.shopmodel);
    print(this.servicename);
    print(this.serviceprice);
    print(this.day);
    print(this.month);
    print(this.year);
    print(this.hours);
    print(this.minutes);
    print(this.notes);
    print(this.paymentstatus);
  }
}
