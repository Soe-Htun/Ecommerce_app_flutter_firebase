import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/screens/login.dart';
import 'package:ecommerce_app_flutter_firebase/screens/signup.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/already_account.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/shopping.png")
                  )
                ),
              ),
              const SizedBox(height: 10),
              const Text("Welcome",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: kBackgroundColor
                ),
              ),

              Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Ready To Start Shopping Sign Up",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Text("To get Started",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 40,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: CustomButton(
                  color: kPrimaryColor,
                  textColor: kTextColor,
                  fontWeight: FontWeight.bold,
                  text: "Sign Up", 
                  onPress: (){
                    Get.to(const SignUp());
                  }
                )
              ),

              const SizedBox(height: 20,),
              AlreadyHaveAccount(
                login: false,
                press: (){
                  Get.to(const Login());
                }
              )
            ],
          ),
        ),
      ),
      );
  }
}