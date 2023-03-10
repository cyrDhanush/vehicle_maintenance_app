import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class carCarousal extends StatefulWidget {
  final Function? setCurrentpage;
  final List items;
  const carCarousal({Key? key, this.setCurrentpage, this.items = const []})
      : super(key: key);

  @override
  State<carCarousal> createState() => _carCarousalState();
}

class _carCarousalState extends State<carCarousal> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            // height: 180,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: [
                for (var i in widget.items) i,
              ],
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 16 / 9,
                  enlargeFactor: 0.3,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  scrollPhysics: BouncingScrollPhysics(),
                  onPageChanged: (int page, s) {
                    widget.setCurrentpage ?? (page);
                    setState(() {
                      currentpage = page;
                    });
                  }),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.items.length; i++)
              Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: 7,
                    width: (i == currentpage) ? (20) : (7),
                    decoration: BoxDecoration(
                      color: (i == currentpage)
                          ? (maintheme)
                          : (Colors.grey.withAlpha(150)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class buildVehiclecard extends StatelessWidget {
  const buildVehiclecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/vehiclebg.jpg',
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(25),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Toyota Prius 2013',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(150),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Mileage",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "134,571",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
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
