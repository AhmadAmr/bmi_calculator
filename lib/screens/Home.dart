import 'package:bmi_calculator/components/fancy_card.dart';
import 'package:bmi_calculator/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bmiController.dart';
import '../components/main_button.dart';
import '../components/round_button.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);
enum Gender { male, female }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FancyCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender == Gender.male)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(color: Color(0xFF8D8E98)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FancyCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender == Gender.female)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(color: Color(0xFF8D8E98)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: FancyCard(
                 colour: kActiveCardColour,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Height",
                        style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        const Text("cm",
                            style: TextStyle(
                                color: Color(0xFF8D8E98), fontSize: 18.0)),
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double currentHeight) {
                          setState(() {
                            height = currentHeight.round();
                          });
                        },
                        min: 120,
                        max: 200,
                      ),
                    )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children:[
                Expanded(
                  child: FancyCard(
                      colour: kActiveCardColour,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Weight" ,style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
                          Text(weight.toString(),style:const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                onPressed: (){
                                  setState(() {
                                    weight --;
                                  });

                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(width: 15.0),
                              RoundButton(
                                onPressed: (){
                                  setState(() {
                                    weight ++;
                                  });

                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),

                  ),
                ),
                Expanded(
                  child: FancyCard(
                      colour: kActiveCardColour,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age" ,style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
                          Text(age.toString(),style:const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                onPressed: (){
                                  setState(() {
                                    age --;
                                  });

                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(width: 15.0),
                              RoundButton(
                                onPressed: (){
                                  setState(() {
                                    age ++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          MainButton(
            buttonTitle: "Calculate",
            onTap: () {
              BmiController  bmi = BmiController(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: bmi.calculateBMI(),
                    resultText: bmi.getResult(),
                    interpretation: bmi.getInterpretation(),
                  )));
            },
          )
        ],
      ),
    );
  }
}
