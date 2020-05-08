import 'package:bmicalculator1/components/bottom_button.dart';
import 'package:bmicalculator1/components/constant.dart';
import 'package:bmicalculator1/components/resuable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget{
  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child:
                Text('Your Results',style: titletext,),
            ),
          ),
          Expanded(
            flex: 5,
            child:
              ReusableCard(
                colour: Color(color1),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),style: TextStyle(color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,fontSize: 22.0),),
                    Text(bmiResult,style: TextStyle(fontSize: 100.0,fontWeight: FontWeight.bold,),),
                    Text(interpretation,style : TextStyle(fontSize: 22.0),textAlign: TextAlign.center,),
                    BottomButton(buttonTitle: 'RE-CALCULATE',
                    onTap: (){
                      Navigator.pop(context);
                    },),

                  ],
                ),
              )
          )
        ],
      )
    );
  }

}