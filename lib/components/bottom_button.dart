import 'package:bmicalculator1/components/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child:Center(
          child:Text(buttonTitle,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        //padding: EdgeInsets.only(bottom:20),
        color: Color(color3),
        margin: EdgeInsets.only(top:10),
        width: double.infinity,
        height: bh,
      ),
    );
  }
}
