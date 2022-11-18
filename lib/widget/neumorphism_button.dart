import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeuButton extends StatefulWidget {
  const NeuButton({Key? key}) : super(key: key);

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    Offset offset = isPressed ? Offset(2, 2) : Offset(1, 1);
    double blur = 0;
    return GestureDetector(
      onTap: () => setState(() {
        isPressed = !isPressed;
      }),
      child: AnimatedContainer(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            "Lazy Loading",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        duration: Duration(microseconds: 100),
        // width: 120,
        // height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.lightBlueAccent,
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: offset,
              color: Color.fromARGB(255, 209, 209, 209),
              inset: isPressed,
            ),
            BoxShadow(
              blurRadius: blur,
              offset: -offset,
              color: Colors.white,
              inset: isPressed,
            ),
          ],
        ),
      ),
    );
  }
}
