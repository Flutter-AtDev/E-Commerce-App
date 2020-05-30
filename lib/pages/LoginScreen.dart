import 'package:ecommerceapp/customwidgets/custom_logo_app.dart';
import 'package:ecommerceapp/customwidgets/custom_text_field.dart';
import 'package:ecommerceapp/services/AuthApp.dart';
import 'package:ecommerceapp/utils/Colors.dart';
import 'package:ecommerceapp/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String email, password;
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: height * .16,
              ),
              CustomLogoApp(),
              SizedBox(height: height * .08),
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
                child: Builder(
                  builder:(context)=> FlatButton(
                    onPressed: () async{
                      bool isValidate = _globalKey.currentState.validate();
                      if (isValidate) {
                        setState(() {
                          isLoading=true;
                        });
                        _globalKey.currentState.save();
                        try {
                          print('$email : $password');
                          final result = await AuthApp().Login(email, password);
                          print(result.user.uid);
                        }catch(e){
                          setState(() {
                            isLoading=false;
                          });
                          print(e);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        }
                        //LoginUser();
                      }
                    },
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
              ),
              SizedBox(
                height: height * .07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont Have Account ? ',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SIGNUPSCREEN_ID);
                    },
                    child: Text(
                      'Sign Up',
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
      ),
    );
  }

//  void LoginUser() {
//    AuthUser.
//  }
}
