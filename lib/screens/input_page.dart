import 'package:bmicalculator1/calculate.dart';
import 'package:bmicalculator1/components/bottom_button.dart';
import 'package:bmicalculator1/components/constant.dart';
import 'package:bmicalculator1/components/icon_content.dart';
import 'package:bmicalculator1/components/resuable_card.dart';
import 'package:bmicalculator1/screens/results_page.dart';
import 'package:bmicalculator1/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
int height =180;
int weight=60;
int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:
            Row(
              children: <Widget>[
                Expanded(

                  child:
                  ReusableCard(
                    onPress:(){
                      setState(() {
                        selectedGender=Gender.male;
                      });

                   },
                  colour: selectedGender==Gender.male?
                  Color(color1)
                  :Color(color2),
                  cardChild: IconContents(icon: FontAwesomeIcons.mars,text: 'MALE',),),
                ),
                Expanded(

                  child:
                 ReusableCard(
                   onPress:(){
                     setState(() {
                       selectedGender=Gender.female;
                     });
                   },
                   colour: selectedGender==Gender.female
                       ?Color(color1)
                       :Color(color2), cardChild: IconContents(
                   icon: FontAwesomeIcons.venus,text: 'FEMALE',
                 ),),
                ),
              ],
            ),
          ),
          Expanded(
            child:
           ReusableCard(colour: Color(color1),
           cardChild: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              Text('HEIGHT',style: labelTextStyle,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.alphabetic,
                 children: <Widget>[
                   Text(height.toString(),
                   style: sizebigText ),
                   Text(' cm',
                   style: labelTextStyle,),
                 ],
               ),
               Slider(
                value: height.toDouble(),
                 min:120.0,
                 max: 220.0,
                 activeColor: Color(color3),
                 inactiveColor: Color(0xFF8D8E98),
                 onChanged: (double newValue){
                  setState(() {
                    height=newValue.round();
                  });

                 },
              ),
             ],
           ),)
          ),
          Expanded(
            child:
            Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(colour: Color(color1),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: labelTextStyle,),
                        Text(weight.toString(),style: sizebigText,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPress: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),

                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(

                  child:
                  ReusableCard(colour: Color(color1),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: labelTextStyle,),
                          Text(age.toString(),style: sizebigText,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),

                            ],
                          ),
                        ],
                      ),)
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap:  (){
            CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult:calc.calculateBMI() ,
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),

            )));
          },)
        ],

      ),
    );
  }
}

