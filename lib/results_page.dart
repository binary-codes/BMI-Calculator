import 'bottom_button.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable_card.dart';
//import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  
  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                 style: titleTextStyle
              ),
            ),
          ),

          Expanded(
            flex:5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  Text(resultText.toUpperCase(), style: resultTextStyle,),

                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center ,
                    style: bodyTextStyle,),
                ]
              ),
            )
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, 
          buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}