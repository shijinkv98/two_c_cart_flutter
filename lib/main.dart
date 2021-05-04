import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_c_cart/notifiers/loginnotifier.dart';
import 'package:two_c_cart/notifiers/registernotifier.dart';

import 'Screens/splashScreen.dart';
import 'helper/constants.dart';
import 'notifiers/cartnotifier.dart';
import 'notifiers/dataupdatenotifier.dart';
import 'notifiers/documents_notifier.dart';
import 'notifiers/homenotifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DocsAddedNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterUpdateNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginUpdateNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeUpdateNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataUpdateNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartUpdateNotifier(),
        ),
      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '2c Cart',
        theme:  ThemeData(
          primaryColor: colorPrimary,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.white,
            titleTextStyle: TextStyle(fontFamily: "bold_font",fontSize: 12),
          ),
          fontFamily: 'regular_font',
          // primarySwatch: colorPrimary,
          visualDensity: VisualDensity.standard,
        ),
        home: SplashScreen(),
    ),
      );
  }
}

