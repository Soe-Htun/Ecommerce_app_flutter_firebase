import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:flutter/material.dart';
class AlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function()? press;

  const AlreadyHaveAccount({ Key? key,
    this.login = true,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ?" : "Already have an account ?",
          style: const TextStyle(
            fontSize: 15
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up" : " Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}