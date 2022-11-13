import 'package:flutter/material.dart';

class WeightWidget extends StatefulWidget {
  final Function(int) onChange;
  const WeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  int _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          elevation: 20,
          shape: const RoundedRectangleBorder(),
          child: Column(
            children: [
              const Text(
                "Weight",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weight.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "kg",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
              Slider(
                min: 0,
                max: 200,
                value: _weight.toDouble(),
                activeColor: Colors.deepPurple.shade400,
                inactiveColor: Colors.deepOrange.shade50,
                thumbColor: Colors.pink.shade100,
                onChanged: (value) {
                  setState(() {
                    _weight = value.toInt();
                  });
                  widget.onChange(_weight);
                },
              )
            ],
          )),
    );
  }
}
