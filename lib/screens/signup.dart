import 'package:ecommerce_app_flutter_firebase/screens/login.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/already_account.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_button.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/custom_text_field.dart';
import 'package:ecommerce_app_flutter_firebase/widgets/password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static String valid = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(valid);
  bool obscureText = true;
  String? _email;
  String? _password;
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void validation() async{
    final FormState? _form = _formKey.currentState;
    if(!_form!.validate()) {
      try {
        auth.createUserWithEmailAndPassword(email: _email!, password: _password!);
        Get.to(const Login());
      } on PlatformException catch (e) {
        // _scaffoldKey.currentState.
        Get.snackbar(
          "Message",
          e.message.toString()
        );

      }
    } else {
      print("No");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("Register",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      text: 'UserName', 
                      validator: (value){
                         if(value == "") {
                          return "UserName is required";
                        }
                        return "";
                      },
                      onChanged: (value){},
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
                          _email = value;
                        });
                        print(_email);
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
                        return "";
                      },
                      onChanged: (value){
                        setState(() {
                          _password = value;
                        });
                        print(_password);
                      },
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      text: 'Phone Number',
                      validator: (value){
                        if(value == "") {
                          return "Phone Number is requied";
                        } else if(value!.length < 9) {
                          return "Phone number must be 11";
                        } 
                        return "";
                      },
                      onChanged: (value){}, 
                    ),
        
                    CustomButton(
                      text: 'Register', 
                      onPress: () {
                        validation();
                      }
                    ),
        
                    AlreadyHaveAccount(
                      login: false,
                      press: (){
                        // Get.toNamed("/");
                        Get.offAll(const Login(),
                          duration: const Duration(milliseconds: 2000)
                        );
                      }
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}