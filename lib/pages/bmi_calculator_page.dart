import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_07600442/pages/bmi_result_page.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'bmi_details/age_widget.dart';
import 'bmi_details/gender_widget.dart';
import 'bmi_details/height_widget.dart';
import 'bmi_details/weight_widget.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  var _gender = 0;
  var _age = 25;
  var _height = 160;
  var _weight = 55;
  var _isCalculator = false;
  var _bmiResult = 0.0;

  void bmiCalculator() {
    _bmiResult = _weight / (pow((_height / 100), 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณค่าดัชนีมวลกาย (BMI)"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  AgeWidget(
                    onChange: (ageVal) {
                      _age = ageVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  WeightWidget(
                    onChange: (weightVal) {
                      _weight = weightVal;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60
                    ),
                    child: SwipeableButtonView(
                        isFinished: _isCalculator,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ResultPage(
                                    bmiResult: _bmiResult,
                                    age: _age,
                                    height: _height,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isCalculator = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          bmiCalculator();

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isCalculator = true;
                            });
                          });
                        },
                        activeColor: Colors.blueGrey,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
