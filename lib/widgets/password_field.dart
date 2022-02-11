import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String text;
  // final Function()? onTap;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  const PasswordField({ Key? key,
    required this.text,
    // required this.onTap,
    required this.validator,
    required this.onChanged
  
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;
  @override
  void initState() {
    isHidden = true;
    super.initState();
  }
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.text,
        suffixIcon: InkWell(
          child: Icon(
            isHidden 
            ? Icons.visibility
            : Icons.visibility_off,
            color: Colors.black,
          ),
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
        ),
        hintStyle: const TextStyle(
          color: Colors.black
        ),
        
      ),
      validator:  widget.validator,
      onChanged: widget.onChanged,
    );
  }
}