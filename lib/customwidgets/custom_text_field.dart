
import 'package:ecommerceapp/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {

  final String hint;
  final IconData icon;

  CustomTextFiled({@required this.hint,@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 4, 30, 10),
      child: TextField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
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