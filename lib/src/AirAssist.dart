import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'Profile.dart';
import 'Widget/bottom_nag_demo_front.dart';
import 'boiler.dart';
import 'constants/color_constant.dart';
import 'constants/style_constant.dart';
import 'models/carousel_model.dart';
import 'models/travlog_model.dart';
import 'dart:convert' show json, base64, ascii;

class AirAssist extends StatefulWidget {
  @override
  _AirAssistState createState() => _AirAssistState();
  const AirAssist();
}

class _AirAssistState extends State<AirAssist> {
  final List<String> entries = <String>[
    'Level 1 - Health Issue',
    'Level 2 - Flight Sickness',
    'Level 3 - Call Assistance'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            'Our Travel Vlogs!',
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
                          child:
                              Image.asset('assets/image/logo.jpg', height: 27),
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
        ),
        ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // section 2 - Breaking News
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Air Assistance requirement',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'You might need this!!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text(' ${entries[index]}')),
                  );
                }),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discuss With Passengers - IntraNet!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'inter',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
