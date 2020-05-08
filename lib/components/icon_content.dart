import 'package:bmicalculator1/components/constant.dart';
import 'package:flutter/material.dart';

class IconContents extends StatelessWidget {
  IconContents({this.icon, this.text});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text,style: labelTextStyle)
      ],
    );
  }
}


