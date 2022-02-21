import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homepage.dart';
import 'package:ecommerce_app_flutter_firebase/screens/signup.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homescreen.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/already_account.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_text_field.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    static String valid = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(valid);
    String? _email;
    String? _password;
    final auth = FirebaseAuth.instance;
    Widget build(BuildContext context) {
    void validation() async {
      final FormState? _form = _loginFormKey.currentState;
      if(_form!.validate()) {
        try {
          UserCredential user =await auth.createUserWithEmailAndPassword(email: _email!, password: _password!);
          // Get.to(HomePage());
          print('User ==> ${user}'); 
          Get.to(HomeScreen());
          
          
        } on FirebaseAuthException catch (e) {
          // TODO
          // Get.snackbar(
          //   "Message",
          //    e.message.toString()
          // );
          _scaffoldKey.currentState?.showSnackBar(
            SnackBar(content: Text(e.message.toString()))
          );
        } 
      } else {
        print("No");
      }
    }
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                // color: Colors.blue,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    CustomTextField(
                      text: 'Email', 
                      validator: (value){
                        if(value == "") {
                          return "Email is required";
                        } else if (!regExp.hasMatch(value!)) {
                            return "Email is invalid";
                        }
                      },
                      onChanged: (value){
                        setState(() {
                          _email = value?.trim();
                        });
                      },
                    ),
                    PasswordField(
                      
                      text: "Password",
                      validator: (value){
                        if(value == "") {
                          return "Password is required";
                        } else if(value!.length < 8) {
                          return "Password is Too Short";
                        } 
                      },
                      onChanged: (value){
                        _password = value?.trim();
                      },
                    ),
                    CustomButton(
                      color: kPrimaryColor,
                      textColor: kTextColor,
                      text: 'Login', 
                      onPress: () {
                       validation();
                      }
                    ),
          
                    AlreadyHaveAccount(
                      press: (){
                        // Get.toNamed("/signUp");
                        Get.offAll(const SignUp(),
                          duration: const Duration(milliseconds: 2000)
                        );
                      }
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}