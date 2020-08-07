import 'package:flutter/material.dart';
import 'package:halopos/business.dart';
import 'package:halopos/home.dart';
import 'package:halopos/registration.dart';
import 'package:halopos/utils/transition.dart';
import 'login.dart';
import 'splash.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2e74ff),
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => SplashPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/registration': (BuildContext context) => RegistrationPage(),
        '/home': (BuildContext context) => HomePage(title: 'Home'),
        '/business': (BuildContext context) => BusinessPage(title: 'Business')
      },
    );
  }
}
