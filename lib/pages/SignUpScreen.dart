import 'package:ecommerceapp/customwidgets/custom_logo_app.dart';
import 'package:ecommerceapp/customwidgets/custom_text_field.dart';
import 'package:ecommerceapp/services/AuthApp.dart';
import 'package:ecommerceapp/utils/Colors.dart';
import 'package:ecommerceapp/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String name, email, password;

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    //
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Form(
        key: globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: height * .16,
            ),
            CustomLogoApp(),
            SizedBox(height: height * .08),
            CustomTextFiled(
                onClick: (value) {
                  name = value;
                },
                hint: NAME_HINT,
                icon: Icons.person),
            CustomTextFiled(
                onClick: (value) {
                  email = value;
                },
                hint: EMAIL_HINT,
                icon: Icons.email),
            CustomTextFiled(
                onClick: (value) {
                  password = value;
                },
                hint: Password_HINT,
                icon: Icons.lock),
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                onPressed: () async {
                  print('pressed...');
                  bool isValidate = globalKey.currentState
                      .validate(); // Force Rebuild to call VAlidators in TextFormField
                  if (isValidate) {
                    globalKey.currentState.save();
                    print('$email : $password');
                    final result =  await AuthApp().SignUp(email, password);
                    print(result.user.uid);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.black,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Have an Account ? ',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LOGINSCREEN_ID);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .06,
            )
          ],
        ),
      ),
    );
  }
}
