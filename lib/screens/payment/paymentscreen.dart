import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/payment/paymentsuccessfull.dart';
import 'package:vehicle_maintenance_app/services/payment_services.dart';
import 'package:vehicle_maintenance_app/widgets/carcarousal.dart';
import 'package:vehicle_maintenance_app/widgets/loadingblock.dart';

TextStyle cardhead = TextStyle(
  fontSize: 13,
  color: Colors.white,
);
TextStyle cardans = TextStyle(
  fontSize: 15,
  color: Colors.white,
);

class paymentScreen extends StatefulWidget {
  final List<DocumentSnapshot> servicesnapshots;
  const paymentScreen({Key? key, required this.servicesnapshots})
      : super(key: key);

  @override
  State<paymentScreen> createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  int totalprice = 0;
  PaymentServices paymentServices = PaymentServices();

  payservices() async {
    await paymentServices.payforService(widget.servicesnapshots);
    print('completed');
  }

  getConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Are you sure you want to complete payment?\n₹ ' +
              totalprice.toString()),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('Yes'),
              onPressed: () async {
                loadingBlock(context: context);
                await payservices();
                Navigator.pop(context); // to pop loading block
                Navigator.pop(context); // to pop dialog box
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => paymentSuccessfullScreen()));
              },
            ),
          ],
        );
      },
    );
  }

  calculatetotal() {
    for (DocumentSnapshot doc in widget.servicesnapshots) {
      totalprice += int.parse(doc.get('serviceprice'));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculatetotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        leadingWidth: 100,
        title: Text(
          "Payment",
          style: TextStyle(
            color: darktext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'LINKED CARDS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'ADD NEW',
                  style: TextStyle(
                    fontSize: 14,
                    color: maintheme,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 260,
              child: carCarousal(
                items: [
                  buildCreditCard(),
                  buildCreditCard(),
                  buildCreditCard(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 7,
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.servicesnapshots.first
                                              .get('shopname'),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          widget.servicesnapshots.first
                                              .get('servicedate'),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: darktext.withAlpha(100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info_outline_rounded,
                                      color: maintheme,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: widget.servicesnapshots.length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return billdetails(
                                        servicename: widget.servicesnapshots[i]
                                            .get('servicename'),
                                        price: widget.servicesnapshots[i]
                                            .get('serviceprice'),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total: ₹ ' + totalprice.toString(),
                                    style: TextStyle(
                                      color: maintheme,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      child: Image.asset(
                                        'assets/images/creditcardbg.jpg',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'My Personal Card',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: OutlinedButton(
                onPressed: () {
                  getConfirmation(context);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Complete Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class billdetails extends StatelessWidget {
  final String servicename;
  final String price;
  const billdetails({Key? key, this.servicename = 'Detail', this.price = '50'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              servicename,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: darktext,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '₹ ' + price.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: darktext,
            ),
          ),
        ],
      ),
    );
  }
}

class buildCreditCard extends StatelessWidget {
  const buildCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 240,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 30,
        child: Stack(
          children: [
            Container(
              // height: 240,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/creditcardbg.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              // height: 240,
              // width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'My Personal Card',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Credit Card Number',
                                    style: cardhead,
                                  ),
                                  Text(
                                    'xxxx - xxxx - xxxx - 4783',
                                    style: cardans,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Name on the Card',
                                    style: cardhead,
                                  ),
                                  Text(
                                    'DREW FULLER',
                                    style: cardans,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Expiration',
                                    style: cardhead,
                                  ),
                                  Text(
                                    '09/23',
                                    style: cardans,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'CVV/CVS',
                                    style: cardhead,
                                  ),
                                  Text(
                                    '***',
                                    style: cardans,
                                  ),
                                ],
                              ),
                              // Text(
                              //   'Credit Card Number',
                              //   style: cardhead,
                              // ),
                              // Text(
                              //   'xxxx - xxxx - xxxx - 4783',
                              //   style: cardans,
                              // ),
                              // Text(
                              //   'Credit Card Number',
                              //   style: cardhead,
                              // ),
                              // Text(
                              //   'xxxx - xxxx - xxxx - 4783',
                              //   style: cardans,
                              // ),
                            ],
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
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.white.withAlpha(150),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
