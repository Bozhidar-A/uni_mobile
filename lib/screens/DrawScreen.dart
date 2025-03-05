import 'package:flutter/material.dart';
import 'package:uni_mobile/state.dart';
import 'package:uni_mobile/widgets/InputField.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({super.key});

  @override
  State<DrawScreen> createState() => DrawScreenState();
}

class DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("a=${a.value.toStringAsFixed(0)}"),
            Text("b=${b.value.toStringAsFixed(0)}"),
            const SizedBox(height: 20), //some buffer so it looks good
            //SingleChildScrollView only handles one direction at a time
            //???? this is dumb
            //wrap in Expanded and handle both axis directions
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: a.value * 10,
                    width: b.value * 10,
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
