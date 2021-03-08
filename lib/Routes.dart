import 'package:flutter/material.dart';
import 'package:parllax/Screen/Settings.dart';
import 'package:parllax/Screen/Home.dart';

import 'Screen/Bottom.dart';
import 'Screen/FetchData.dart';
import 'Screen/JsonData.dart';
import 'Screen/Swipe.dart';
import 'Screen/WhatsApp_Home.dart';
import 'Screen/loginApp.dart';
import 'Screen/music.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/second': (context) => Settings(),
        '/three': (context) => TabPage(),
        '/four': (context) => MainFetchData(),
        '/five': (context) => HomePages(),
        '/sex': (context) => LoginApp(),
        '/seven': (context) => Music(),
        '/eight': (context) => Swipe(),
        '/nine': (context) => WhatsAppHome(),
      },
    );
  }
}
