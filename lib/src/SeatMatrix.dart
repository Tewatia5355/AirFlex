import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/HomeScreen.dart';
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

class SeatMatrix extends StatefulWidget {
  @override
  _SeatMatrixState createState() => _SeatMatrixState();
  const SeatMatrix();
}

class _SeatMatrixState extends State<SeatMatrix> {
  var _chairStatus = [
    [1, 3, 1, 1, 1, 1, 1, 1, 1],
    [1, 3, 1, 1, 3, 1, 3, 3, 1],
    [1, 1, 3, 1, 1, 3, 3, 3, 1],
    [3, 2, 3, 1, 3, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 3, 1],
    [1, 3, 3, 1, 1, 1, 3, 3, 1],
    [1, 1, 1, 1, 1, 1, 3, 1, 3],
    [1, 3, 3, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 3, 3, 1],
    [1, 3, 1, 1, 1, 1, 3, 1, 1],
    [3, 3, 1, 1, 1, 1, 1, 3, 1],
    [3, 3, 3, 1, 1, 1, 3, 3, 1],
    [3, 3, 1, 1, 1, 1, 1, 3, 1],
    [1, 1, 1, 1, 1, 1, 3, 3, 1],
    [1, 3, 1, 1, 1, 1, 3, 1, 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Seat Matrix",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          for (int i = 0; i < 9; i++)
            Container(
              margin: EdgeInsets.only(top: i == 0 ? 50 : 0),
              child: Row(
                children: <Widget>[
                  for (int x = 1; x < 9; x++)
                    Expanded(
                      child: (x == 4) || (x == 5)
                          ? Container()
                          : Container(
                              margin: EdgeInsets.all(5),
                              child: _chairStatus[i][x - 1] == 1
                                  ? availableChair(i, x - 1)
                                  : _chairStatus[i][x - 1] == 2
                                      ? selectedChair(i, x - 1)
                                      : _chairStatus[i][x - 1] == 3
                                          ? reservedChair()
                                          : requestChair(i, x - i),
                            ),
                    )
                ],
              ),
            ),
          SizedBox(height: 10),
          ButtonCard(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Boiler.fromBase64(
                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c")));
            },
            title: 'Book it!',
          ),
        ],
      ),
    );
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 2;
        setState(() {});
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        for (int i = 0; i < 9; i++)
          for (int x = 1; x < 9; x++)
            if (_chairStatus[i][x - 1] == 4) _chairStatus[i][x - 1] = 1;
        _chairStatus[a][b] = 4;
        setState(() {});
      },
      child: Container(
        height: 40.0,
        width: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget requestChair(int a, int b) {
    return InkWell(
      onTap: () {
        for (int i = 0; i < 9; i++)
          for (int x = 1; x < 9; x++)
            if (_chairStatus[i][x - 1] == 4) _chairStatus[i][x - 1] = 1;
        _chairStatus[a][b] = 1;
        setState(() {});
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }

  Widget reservedChair() {
    return Container(
      height: 40.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(15, 15, 15, 0.24),
          borderRadius: BorderRadius.circular(3.0)),
    );
  }
}
