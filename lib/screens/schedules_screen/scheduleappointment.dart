import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/commonvars.dart';
import 'package:vehicle_maintenance_app/data.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/models/servicemodel.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleconfirmation.dart';

class scheduleAppointment extends StatefulWidget {
  final ServiceModel serviceModel;
  const scheduleAppointment({Key? key, required this.serviceModel})
      : super(key: key);

  @override
  State<scheduleAppointment> createState() => _scheduleAppointmentState();
}

class _scheduleAppointmentState extends State<scheduleAppointment> {
  int? servicevalue;
  DateTime selecteddate = DateTime.now();
  TimeOfDay selectedtime = TimeOfDay.fromDateTime(DateTime.now());
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Schedule",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'SELECT SERVICE',
                      style: subtitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: maintheme,
                              ),
                            ),
                            child: DropdownButton(
                              items: [
                                for (int i = 0; i < services.length; i++)
                                  DropdownMenuItem(
                                    value: i,
                                    child: Text(services.keys.elementAt(i)),
                                  ),
                              ],
                              value: servicevalue,
                              alignment: AlignmentDirectional.centerStart,
                              borderRadius: BorderRadius.circular(12),
                              isExpanded: true,
                              style: TextStyle(
                                fontSize: 16,
                                color: darktext,
                              ),
                              underline: Container(),
                              hint: Text('Services'),
                              icon: Icon(
                                CupertinoIcons.chevron_down,
                                size: 20,
                                color: darktext,
                              ),
                              onChanged: (a) {
                                setState(() {
                                  servicevalue = a;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'SELECT DATE AND TIME',
                      style: subtitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextButton(
                            onPressed: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selecteddate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025, 2),
                              );
                              if (picked != null && picked != selecteddate) {
                                setState(() {
                                  selecteddate = picked;
                                  print(selecteddate);
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                width: 1,
                                color: maintheme,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                selecteddate.day.toString() +
                                    ' / ' +
                                    months[selecteddate.month] +
                                    ' / ' +
                                    selecteddate.year.toString() +
                                    '  ( ' +
                                    days[selecteddate.weekday] +
                                    ' )',
                                style: TextStyle(
                                  color: darktext,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: TextButton(
                            onPressed: () async {
                              TimeOfDay? pickedtime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()),
                              );
                              if (pickedtime != null) {
                                setState(() {
                                  selectedtime = pickedtime;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(
                                width: 1,
                                color: maintheme,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                selectedtime.hourOfPeriod.toString() +
                                    ' : ' +
                                    selectedtime.minute.toString() +
                                    '   ' +
                                    selectedtime.period.name.toUpperCase(),
                                style: TextStyle(
                                  color: darktext,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Note: The date and time will be confirmed by the service provider within 24 hours after scheduling through Vehicle Manager. You'll be notified by email, text or a phone call, based on your preference.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                        color: darktext.withAlpha(100),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'NOTES',
                          style: subtitle,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: maintheme,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        controller: notes,
                        keyboardType: TextInputType.multiline,

                        minLines: 5,
                        maxLines: 5,
                        // expands: true,
                        decoration: InputDecoration(
                          hintText:
                              'Add additional notes about your visit and/or maintenance need',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: maintheme,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 500,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (servicevalue != null &&
                    selecteddate != null &&
                    selectedtime != null) {
                  print(servicevalue);
                  print(selecteddate.day);
                  print(selectedtime);
                  widget.serviceModel.servicename =
                      services.keys.elementAt(servicevalue!);
                  widget.serviceModel.serviceprice =
                      services.values.elementAt(servicevalue!).toString();

                  widget.serviceModel.day = selecteddate.day.toString();
                  widget.serviceModel.month = (selecteddate.month).toString();
                  widget.serviceModel.year = selecteddate.year.toString();
                  widget.serviceModel.hours = selectedtime.hour.toString();
                  widget.serviceModel.minutes = selectedtime.minute.toString();
                  widget.serviceModel.notes = notes.text;

                  Navigator.pushNamed(context, '/scheduleconfirmation',
                      arguments: widget.serviceModel);
                }
                widget.serviceModel.printer();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: maintheme,
                padding: EdgeInsets.symmetric(vertical: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  width: 0.5,
                  color: darktext,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darktext,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
