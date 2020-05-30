import 'package:ecommerceapp/utils/Colors.dart';
import 'package:ecommerceapp/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;

  CustomTextFiled({@required this.onClick,@required this.hint, @required this.icon});

  String errorMessage(String hint) {
    switch (hint) {
      case NAME_HINT:
        return 'Name is EMpty !';
      case EMAIL_HINT:
        return 'Email is EMpty !';
      case Password_HINT:
        return 'Password is EMpty !';
      default:
        return 'Value is EMpty !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 4, 30, 10),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return errorMessage(hint);
          }
        },
        onSaved: onClick,
        textAlign: TextAlign.left,
        obscureText: hint == Password_HINT ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[700],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hint,
          fillColor: BG_TEXTFIELD_LOGIN,
          filled: true,
        ),
      ),
    );
  }
}
