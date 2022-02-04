import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/AirAssist.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomeScreen.dart';
import 'Profile.dart';
import 'SeatMatrix.dart';
import 'Widget/bottom_nag_demo_front.dart';
import 'constants/color_constant.dart';
import 'constants/style_constant.dart';
import 'models/carousel_model.dart';
import 'models/travlog_model.dart';
import 'dart:convert' show json, base64, ascii;

class Boiler extends StatefulWidget {
  @override
  _BoilerState createState() => _BoilerState();

  Boiler(this.jwt, this.payload);

  factory Boiler.fromBase64(String jwt) => Boiler(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;
}

class _BoilerState extends State<Boiler> {
  int _selectedIndex = 0;
  var bottomTextStyle =
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const _pages = <Widget>[
    const HomeScreen(), //this is a stateful widget on a separate file
    const SeatMatrix(),
    const AirAssist(),
    const Profile() //this is a stateful widget on a separate file
    // School(),//this is a stateful widget on a separate file
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mCardTitleColor,
          title: Image.asset('assets/image/logo.jpg', height: 50),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          height: 64,
          decoration: BoxDecoration(
            color: mFillColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 5))
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? new Image.asset('assets/image/flight color.png',
                        height: 32)
                    : new Image.asset('assets/image/flight.png', height: 32),
                title: Text(
                  'Flight',
                  style: bottomTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? new Image.asset('assets/image/seat color.png', height: 32)
                    : new Image.asset('assets/image/seat.png', height: 32),
                title: Text(
                  'Seat Swap',
                  style: bottomTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? new Image.asset('assets/image/hostess color.png',
                        height: 32)
                    : new Image.asset('assets/image/hostess.png', height: 32),
                title: Text(
                  'Air Assistance',
                  style: bottomTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? new Image.asset('assets/image/user color.png', height: 32)
                    : new Image.asset('assets/image/user.png', height: 32),
                title: Text(
                  'Profile',
                  style: bottomTextStyle,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: mBlueColor,
            unselectedItemColor: mSubtitleColor,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            elevation: 0,
          ),
        ));
  }
}
