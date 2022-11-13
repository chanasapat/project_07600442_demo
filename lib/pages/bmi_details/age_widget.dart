import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final Function(int) onChange;

  const AgeWidget({Key? key, required this.onChange,}) : super(key: key);

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int _age = 25;

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
                "Age",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _age.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "year",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
              Slider(
                min: 0,
                max: 100,
                value: _age.toDouble(),
                activeColor: Colors.deepPurple.shade400,
                inactiveColor: Colors.deepOrange.shade50,
                thumbColor: Colors.pink.shade100,
                onChanged: (value) {
                  setState(() {
                    _age = value.toInt();
                  });
                  widget.onChange(_age);
                },
              )
            ],
          )),
    );
  }
}
