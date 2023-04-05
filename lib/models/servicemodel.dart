class ServiceModel {
  String? shopname;
  String? servicename;
  String? day;
  String? month;
  String? year;
  String? hours;
  String? minutes;
  String? notes;
  String? paymentstatus;

  ServiceModel({
    this.shopname,
    this.servicename,
    this.day,
    this.month,
    this.year,
    this.hours,
    this.minutes,
    this.notes = '',
    this.paymentstatus = 'pending',
  });

  void printer() {
    print(this.shopname);
    print(this.servicename);
    print(this.day);
    print(this.month);
    print(this.year);
    print(this.hours);
    print(this.minutes);
    print(this.notes);
    print(this.paymentstatus);
  }
}
