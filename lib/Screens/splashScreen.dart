import 'dart:async';

import 'package:flutter/material.dart';
import 'package:two_c_cart/Screens/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // use Scaffold also in order to provide material app widgets
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.fill,
            )
        ),

      ),
    );
  }
}
