import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icons_button.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender selectedGender;
  int height=180;
  int weight=40;
  int age= 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                  colour: selectedGender==Gender.male ? activeCardColor : inactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                  colour: selectedGender==Gender.female ? activeCardColor : inactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                  ),
              ),
            ],
          )),
             Expanded(child: ReusableCard(
               colour: activeCardColor,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children :<Widget>[
                  Text(
                     'HEIGHT', 
                      style:labelTextStyle,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children:<Widget>[
                       Text(
                         height.toString(),
                       style:numberTextStyle,
                       ),
                       Text(
                         'cm',
                         
                         ),
                   ]
                   ),
                   SliderTheme(    
                     data:SliderTheme.of(context).copyWith(
                       inactiveTrackColor: Color(0xFF8D8E98),
                       activeTrackColor: Colors.white,
                       overlayColor:Color(0x29EB1555),
                       thumbColor :Color(0xFFEB1555),                     
                       thumbShape:RoundSliderThumbShape(enabledThumbRadius: 11.0),
                       overlayShape: RoundSliderOverlayShape(overlayRadius: 21.0),
                     ),
                       child: Slider(
                       value: height.toDouble(),
                       min: 100,
                       max: 300,                      
                       
                       onChanged: (double newValue) {
                       setState(() {
                         height=newValue.round();
                       });
                     },
                     ),
                   ),
                 ],
               ),
               ),
              ),
            Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  children:<Widget>[
                    Text('WEIGHT', style: labelTextStyle),
                    Text(weight.toString(),
                    style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width:10.0),
                          RoundIconButton(
                            icon:FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                      ],
                    )
                  ]
                  ),
                ),
              ),
              Expanded(child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('AGE',style: labelTextStyle,),
                    Text(age.toString(), style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                        ),
                        SizedBox(width:10.0),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            age++;
                          });
                        })
                      ]
                    )
                  ]
                ),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
          ),
        ],
      ),
    );
  }
}