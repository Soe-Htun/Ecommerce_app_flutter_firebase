import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  const CustomTextField({ Key? key,
    required this.text,
    required this.onChanged,
    required this.validator,
    this.keyboardType = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.black
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}