import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  // final TextEditingController controller;

  const CustomTextField({ Key? key,
    required this.text,
    required this.onChanged,
    required this.validator,
    this.keyboardType = TextInputType.text,
    // required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
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