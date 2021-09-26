import 'package:flutter/material.dart';
import 'package:homely_mobile_app/pages/login.dart';
import 'package:homely_mobile_app/pages/otp.dart';

void main() {
  runApp(MyApp());
}

MaterialColor colorCustom = MaterialColor(0xFFC62828, color);

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homely Application',
      theme: ThemeData(
        primarySwatch: colorCustom,//0xFFC62828
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginPage(),
        '/otp': (context) => OtpPage(),
      },
    );
  }
}