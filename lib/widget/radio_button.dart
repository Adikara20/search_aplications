import 'package:flutter/material.dart';

class RadioButtonCustom extends StatelessWidget {
  final int groupVal;
  final int val;
  final String text;
  final void Function(int) setValueRadio;
  const RadioButtonCustom({
    Key? key,
    required this.groupVal,
    required this.val,
    required this.text,
    required this.setValueRadio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: val,
          groupValue: groupVal,
          activeColor: Colors.blue,
          onChanged: ((value) {
            setValueRadio(value as int);
          }),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
