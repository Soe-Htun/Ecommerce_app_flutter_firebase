import 'package:flutter/material.dart';

import '../constants.dart';

class CustomIconButton extends StatelessWidget {
  
  final Function()? onPress;
  final Color color;
  final IconData icon;
  
  const CustomIconButton({ Key? key,
    required this.onPress,
    this.color = kBackgroundColor,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(icon), 
      color: color,
    );
  }
}