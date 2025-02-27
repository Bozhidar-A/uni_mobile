import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final double value;
  final int? maxDigits;
  final Function(double) onValueChanged;

  const InputField({
    Key? key,
    required this.label,
    required this.value,
    this.maxDigits,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$label = "),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            //can use TextFormField for init value but it looks good without it
            maxLength: maxDigits,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Value for $label",
              border: const OutlineInputBorder(),
            ),
            onChanged: (inputValue) {
              onValueChanged(inputValue.isEmpty ? 0 : double.parse(inputValue));
            },
          ),
        ),
      ],
    );
  }
}
