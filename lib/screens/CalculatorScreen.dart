import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorsScreen extends StatefulWidget {
  const CalculatorsScreen({super.key});

  @override
  State<CalculatorsScreen> createState() => CalculatorsScreenState();
}

class CalculatorsScreenState extends State<CalculatorsScreen> {
  double a = 0;
  double b = 0;
  String? symbol;
  double? res;

  Widget BuildInputField(
    String label,
    double value,
    //bs func pass
    Function(double) onValueChanged,
  ) {
    return Column(
      children: [
        Text("$label value = "),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Value for $label",
              border: const OutlineInputBorder(),
            ),
            onChanged: (inputValue) {
              setState(() {
                onValueChanged(
                  inputValue.isEmpty ? 0 : double.parse(inputValue),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  void PerformCalculation(String mathSymbol) {
    switch (mathSymbol) {
      case "+":
        setState(() {
          symbol = "+";
          res = a + b;
        });
        break;
      case "-":
        setState(() {
          symbol = "-";
          res = a - b;
        });
        break;
      case "*":
        setState(() {
          symbol = "*";
          res = a * b;
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
          res = (a / b);
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
            BuildInputField("a", a, (newValue) => a = newValue),
            const SizedBox(height: 20),
            BuildInputField("b", b, (newValue) => b = newValue),
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
              "a(${a.toStringAsFixed(0)}) ${symbol ?? "?"} b(${b.toStringAsFixed(0)}) = ${res == null ? "?" : res?.toStringAsFixed(0)}",
            ),
          ],
        ),
      ),
    );
  }
}
