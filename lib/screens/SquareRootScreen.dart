import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uni_mobile/widgets/InputField.dart';

class SquareRootScreen extends StatefulWidget {
  const SquareRootScreen({super.key});

  @override
  State<SquareRootScreen> createState() => SquareRootScreenState();
}

class SquareRootScreenState extends State<SquareRootScreen> {
  double x = 0;
  double? res;

  void SquareRootMath() {
    setState(() {
      res = sqrt(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: "x",
              value: x,
              onValueChanged: (newValue) => x = newValue,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: SquareRootMath, child: const Text("√")),
            const SizedBox(height: 20),
            Text("√${res == null ? "?" : res!.toStringAsFixed(0)}"),
          ],
        ),
      ),
    );
  }
}
