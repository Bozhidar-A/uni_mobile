import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uni_mobile/widgets/InputField.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({super.key});

  @override
  State<DrawScreen> createState() => DrawScreenState();
}

class DrawScreenState extends State<DrawScreen> {
  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: "width",
              value: width,
              onValueChanged: (newValue) => setState(() => width = newValue),
            ),
            const SizedBox(height: 20),
            InputField(
              label: "height",
              value: height,
              onValueChanged: (newValue) => setState(() => height = newValue),
            ),
            const SizedBox(height: 20),
            //SingleChildScrollView only handles one direction at a time
            //???? this is dumb
            //wrap in Expanded and handle both axis directions
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
