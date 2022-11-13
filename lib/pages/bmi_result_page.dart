import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ResultPage extends StatelessWidget {
  final age;
  final height;
  final bmiResult;

  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ResultPage({Key? key, this.age, this.height, this.bmiResult,}) : super(key: key);

  void setBmiInterpretation() {
    var min_fit = (18.5 * (pow((height / 100), 2))).toStringAsFixed(1);
    var max_fit = (24.9 * (pow((height / 100), 2))).toStringAsFixed(1);

    if (bmiResult >= 40) {
      bmiStatus = "อ้วนระดับสาม";
      bmiInterpretation = "💔💔💔 อ้วนมากๆ\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.redAccent;
    } else if (bmiResult >= 35) {
      bmiStatus = "อ้วนระดับสอง";
      bmiInterpretation = "💔💔 อ้วนมาก\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI ที่อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.deepOrange.shade300;
    } else if (bmiResult >= 30) {
      bmiStatus = "อ้วนระดับต้น";
      bmiInterpretation = "💔 อ้วน\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI ที่อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.orangeAccent;
    } else if (bmiResult >= 25) {
      bmiStatus = "ก่อนเข้าขั้นอ้วน";
      bmiInterpretation = "🌠 เสี่ยงที่จะมีน้ำหนักเกิน\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI ที่อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.orangeAccent.shade100;
    } else if (bmiResult >= 18.5) {
      bmiStatus = "ระดับปกติ";
      bmiInterpretation = "🌟 น้ำหนักปกติ\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI ที่อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.greenAccent.shade400;
    } else if (bmiResult < 18.5) {
      bmiStatus = "น้อยกว่ามาตรฐาน";
      bmiInterpretation = "⭐ น้ำหนักน้อยกว่ามาตรฐาน\nค่าน้ำหนักที่เหมาะสมกับส่วนสูงคือ $min_fit - $max_fit กิโลกรัม\n\n(ค่า BMI ที่อยู่ในช่วงมาตรฐานคือ 18.5 - 24.9 กิโลกรัม/ลูกบาศก์เมตร)\n";
      bmiStatusColor = Colors.blue.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลลัพธ์ค่าดัชนีมวลกาย (BMI)"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "BMI Result",
                      style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 50,
                      segments: [
                        GaugeSegment('น้อยกว่ามาตรฐาน', 18.5, Colors.blue.shade200),
                        GaugeSegment('ระดับปกติ', 6.4, Colors.greenAccent.shade100),
                        GaugeSegment('ก่อนเข้าขั้นอ้วน', 5, Colors.orangeAccent.shade100),
                        GaugeSegment('อ้วนระดับต้น', 5, Colors.orangeAccent),
                        GaugeSegment('อ้วนระดับสอง', 5, Colors.deepOrange.shade300),
                        GaugeSegment('อ้วนระดับสาม', 10.1, Colors.redAccent),
                      ],
                      valueWidget: Text(
                        bmiResult.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 20),
                      ),
                      currentValue: bmiResult.toDouble(),
                      needleColor: Colors.blueGrey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text("Reset"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]))),
    );
  }
}
