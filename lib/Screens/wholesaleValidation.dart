
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:two_c_cart/helper/constants.dart';


class WholeSaleValidationScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<WholeSaleValidationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getContent(),
    );
  }

  Widget getContent() {
    return Container(
        margin: EdgeInsets.only(top: 15),
        // height: MediaQuery.of(context).size.height,
        decoration: getBgBox('assets/images/whl_bg.jpg'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getLogo(),
            getMainHeading('${'Wholesale package Validation'}\n${'Message'}'),
            getButtons()
          ],
        ));
  }

  Widget getMainHeading(String title) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: 80),
      child: Center(
        child: Text(title, style: getText(primaryTextColor),
            textAlign: TextAlign.center),

      ),

    );
  }

  Widget getButtons() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 5),
                width: 130,
                decoration: getCommonOutlineBox(colorPrimary),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(left, 15, right, 15),
                  child: Center(
                      child: Text('NO', style: getText(colorPrimary),)),
                )
            ),
            Container(
                width: 130,
                margin: EdgeInsets.only(left: 5),
                decoration: getCommonBox(colorPrimary),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(left, 15, right, 15),
                  child: Center(child: Text('YES', style: getText(white),)),
                )
            )
          ],
        )
    );
  }

  Widget getLogo(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 70,
      width: 70,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

