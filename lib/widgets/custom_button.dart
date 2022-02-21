import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final Function() onPress;
  const CustomButton({ Key? key,
    required this.text,
    required this.onPress,
    this.color = Colors.grey,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: onPress,
          child: Text(text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize
          ),
          )
      ),
    );
  }
}