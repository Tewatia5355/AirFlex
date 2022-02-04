import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/AddTicket.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'Widget/bottom_nag_demo_front.dart';
import 'constants/color_constant.dart';
import 'constants/style_constant.dart';
import 'models/carousel_model.dart';
import 'models/travlog_model.dart';
import 'dart:convert' show json, base64, ascii;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  const HomeScreen();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
      // Promos Section
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 24),
        child: Text(
          "Hi, User 👋 Let's get you flexible!",
          style: mTitleStyle,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemCount: carousels.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(
                            carousels[index].image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: map<Widget>(
                    carousels,
                    (index, image) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 6,
                        width: 6,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index ? mBlueColor : mGreyColor),
                      );
                    },
                  ),
                ),

                // More
                Text(
                  'More...',
                  style: mMoreDiscountStyle,
                )
              ],
            ),
          ],
        ),
      ),

      // Service Section
      Padding(
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
        child: Text(
          'Your Flights',
          style: mTitleStyle,
        ),
      ),
      Container(
        height: 144,
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/image/past.png',
                          height: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Past',
                                style: mServiceTitleStyle,
                              ),
                              Text(
                                'Past Trips',
                                style: mServiceSubtitleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/image/future.png',
                          height: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Upcoming',
                                style: mServiceTitleStyle,
                              ),
                              Text(
                                'Upcoming Trips',
                                style: mServiceSubtitleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.only(left: 16),
                    height: 64,
                    decoration: BoxDecoration(
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: mBorderColor, width: 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/image/calendar.png',
                          height: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Current',
                                style: mServiceTitleStyle,
                              ),
                              Text(
                                'Current Trip',
                                style: mServiceSubtitleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/image/add.png',
                                height: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Add',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Add new trip',
                                      style: mServiceSubtitleStyle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTicket()));
                        }))
              ],
            ),
          ],
        ),
      ),

      // Travlog Section
      Padding(
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
        child: Text(
          'Travel Vlogs!',
          style: mTitleStyle,
        ),
      ),
      Container(
        height: 181,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 16),
          itemCount: travlogs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(travlogs[index].image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Image.asset('assets/image/logo.jpg', height: 27),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/svg/travlog_bottom_gradient.svg',
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Text(
                          'Explore ' + travlogs[index].name,
                          style: mTravlogTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    travlogs[index].content,
                    maxLines: 3,
                    style: mTravlogContentStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    travlogs[index].place,
                    style: mTravlogPlaceStyle,
                  )
                ],
              ),
            );
          },
        ),
      )
    ]));
  }
}
