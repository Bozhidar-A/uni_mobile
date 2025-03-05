import 'package:flutter/material.dart';
import 'package:uni_mobile/state.dart';
import 'package:uni_mobile/widgets/InputField.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => CalculatorsScreenState();
}

class CalculatorsScreenState extends State<CalculatorScreen> {
  String? symbol;
  double? res;

  void PerformCalculation(String mathSymbol) {
    switch (mathSymbol) {
      case "+":
        setState(() {
          symbol = "+";
          res = a.value + b.value;
        });
        break;
      case "-":
        setState(() {
          symbol = "-";
          res = a.value - b.value;
        });
        break;
      case "*":
        setState(() {
          symbol = "*";
          res = a.value * b.value;
        });
        break;
      case "/":
        if (b == 0) {
          setState(() {
            res = null;
          });
          break;
        }

        setState(() {
          symbol = "/";
          res = (a.value / b.value);
        });
        break;
      default:
        //how? do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              label: "a",
              value: a.value,
              maxDigits: 1,
              onValueChanged: (newValue) => a.value = newValue,
            ),
            const SizedBox(height: 20),
            InputField(
              label: "b",
              value: b.value,
              maxDigits: 1,
              onValueChanged: (newValue) => b.value = newValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => PerformCalculation("+"),
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => PerformCalculation("-"),
                  child: const Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => PerformCalculation("*"),
                  child: const Text("*"),
                ),
                ElevatedButton(
                  onPressed: () => PerformCalculation("/"),
                  child: const Text("/"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "a(${a.value.toStringAsFixed(0)}) ${symbol ?? "?"} b(${b.value.toStringAsFixed(0)}) = ${res == null ? "?" : res?.toStringAsFixed(0)}",
            ),
          ],
        ),
      ),
    );
  }
}
