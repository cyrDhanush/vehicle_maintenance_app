import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/widgets/carcarousal.dart';

TextStyle cardhead = TextStyle(
  fontSize: 13,
  color: Colors.white,
);
TextStyle cardans = TextStyle(
  fontSize: 15,
  color: Colors.white,
);

class cardSelection extends StatefulWidget {
  const cardSelection({Key? key}) : super(key: key);

  @override
  State<cardSelection> createState() => _cardSelectionState();
}

class _cardSelectionState extends State<cardSelection> {
  getConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Are you sure you want to complete payment?'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('Yes'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: TextButton(
          onPressed: () {},
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
                      child: Column(
                        children: [
                          Card(
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Jiffy Libe',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '03/12/2019',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: darktext.withAlpha(100),
                                            ),
                                          ),
                                        ],
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
                                  billdetails(
                                    text: 'Oil Change',
                                    price: 20,
                                  ),
                                  billdetails(
                                    text: 'Standard Checkup',
                                    price: 20,
                                  ),
                                  billdetails(
                                    text: 'Labour',
                                    price: 15,
                                  ),
                                  billdetails(
                                    text: 'Sales Tax',
                                    price: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Total: \$65',
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    OutlinedButton(
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
                    SizedBox(
                      height: 15,
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
  final String text;
  final int price;
  const billdetails({Key? key, this.text = 'Detail', this.price = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: darktext,
            ),
          ),
          Text(
            '\$ ' + price.toString(),
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
