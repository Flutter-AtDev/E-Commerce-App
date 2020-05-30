
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLogoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}