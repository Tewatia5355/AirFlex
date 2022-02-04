import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:flutter_svg/svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'Widget/bottom_nag_demo_front.dart';
import 'constants/color_constant.dart';
import 'constants/style_constant.dart';
import 'models/carousel_model.dart';
import 'models/travlog_model.dart';
import 'dart:convert' show json, base64, ascii;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
  const Profile();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/image/paris.jpg",
                // height: 120,
                // width: 120,
                // fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'Your Flights',
                  style: mTitleStyle,
                ),
              ),
              ButtonCard(
                press: () {},
                title: 'My Rewards',
              ),
              ButtonCard(
                press: () {},
                title: 'Payment Modes',
              ),
              ButtonCard(
                press: () {},
                title: 'Settings',
              ),
              ButtonCard(
                press: () {},
                title: 'My Promocodes',
              ),
              ButtonCard(
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                title: 'Log out',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: mCardTitleColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17.0, color: mFillColor),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: mFillColor,
                size: 18,
              )
            ],
          ),
        ),
        onTap: press,
      ),
    );
  }
}
