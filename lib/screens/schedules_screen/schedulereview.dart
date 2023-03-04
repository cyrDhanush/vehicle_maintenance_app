import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/schedules_screen/scheduleappointment.dart';

class scheduleReview extends StatelessWidget {
  const scheduleReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jiffy Lube',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darktext,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReviewStar(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '756, Barrington Road, Hanover Park 5245',
                      style: subtitle.copyWith(
                        fontSize: 13,
                        color: darktext.withAlpha(100),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    linkfunc(
                      icon: Icons.call_outlined,
                      text: 'Call 1234567890',
                    ),
                    linkfunc(
                      icon: Icons.location_on_outlined,
                      text: 'Get Directions',
                    ),
                    linkfunc(
                      icon: Icons.browse_gallery_outlined,
                      text: 'Go to Website',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => scheduleAppointment()));
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
                            'Schedule Appoinement',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darktext,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "REVIEWS",
                  style: subtitle,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    size: 25,
                    color: darktext,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (int i = 0; i < 3; i++) ReviewTile(),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See all Reviews'),
            ),
          ],
        ),
      ),
    );
  }

  Widget linkfunc({required IconData icon, required String text}) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: maintheme,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: darktext,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: maintheme,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ReviewStar(
                            a: 2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '1 Week ago',
                            style: TextStyle(
                              color: darktext.withAlpha(100),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'by John Butler',
                        style: TextStyle(
                          color: darktext.withAlpha(100),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bad Experience with customer service and adnfnasdfnasdfna ads f asdf as df asdf ',
                        style: TextStyle(
                          color: darktext.withAlpha(100),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: darktext,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: darktext.withAlpha(100),
        ),
      ],
    );
  }
}

class ReviewStar extends StatelessWidget {
  final int a;
  const ReviewStar({Key? key, this.a = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < a; i++)
          Icon(
            Icons.star,
            size: 20,
            color: darktext,
          ),
        for (int i = 0; i < 5 - a; i++)
          Icon(
            Icons.star,
            size: 20,
            color: darktext.withAlpha(100),
          ),
      ],
    );
  }
}
