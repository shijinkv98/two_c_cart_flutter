import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/splashScreen.dart';
import 'helper/constants.dart';
import 'notifiers/documents_notifier.dart';

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

