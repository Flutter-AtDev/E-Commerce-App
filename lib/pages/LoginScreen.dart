import 'package:ecommerceapp/customwidgets/custom_text_field.dart';
import 'package:ecommerceapp/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
  return Scaffold(
      backgroundColor: MAINCOLOR,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height*.16,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17, //130
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/icons/buy.png'),
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Buy it',
                        style: TextStyle(fontFamily: 'Pachinco', fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height*.08),
          CustomTextFiled(hint: 'Enter your Email', icon: Icons.email),
          CustomTextFiled(hint: 'Enter your Password', icon: Icons.lock),
          SizedBox(
            height: height*.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.black,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height*.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Dont Have Account ? ',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                'Sign Up',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
