import 'package:ecommerceapp/pages/Home.dart';
import 'package:ecommerceapp/pages/LoginScreen.dart';
import 'package:ecommerceapp/pages/SignUpScreen.dart';
import 'package:ecommerceapp/utils/Constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LOGINSCREEN_ID,
      routes: {
        LOGINSCREEN_ID: (context) => LoginScreen(),
        SIGNUPSCREEN_ID: (context) => SignUpScreen(),
        HOMESCREEN_ID: (context) => HomePage(),
      },
    );
  }
}
