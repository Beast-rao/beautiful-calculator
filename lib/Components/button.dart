import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final VoidCallback press;

  const Button(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor,required this.press});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:5 ),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: textColor, fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
