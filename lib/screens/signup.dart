import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/screens/login.dart';
import 'package:ecommerce_app_flutter_firebase/services/firebaseService.dart';
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
  String? phoneNumber;
  bool isMale = true;
  String? _password, userName;
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void validation() async{
    final FormState? _form = _formKey.currentState;
    if(!_form!.validate()) {
      try {
        UserCredential result = await auth.createUserWithEmailAndPassword(email: _email!, password: _password!);
        // Get.to( HomeScreen());
        // FirebaseFirestore.instance.collection("Users").doc(result.user?.uid).set({
        //   "UserName": userName,
        //   "UserId": result.user?.uid,
        //   "UserEmail": _email,
        //   "UserGender": isMale? "Male": "Female",
        //   "Phone Number": phoneNumber
        // });
        User? updateUser = FirebaseAuth.instance.currentUser;
        updateUser?.updateProfile(displayName: userName);
        userSetup(userName!);
        debugPrint('Hello ${result.user?.uid}');
      } on FirebaseAuthException catch (e) {
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
                height: 150,
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
                      onChanged: (value){
                        value = userName;
                      },
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
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = !isMale;
                        });
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                isMale? "Male": "Female",
                                style: const TextStyle(
                                  color: kBackgroundColor,
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      onChanged: (value){
                        setState(() {
                          phoneNumber = value;
                        });
                      }, 
                    ),
        
                    CustomButton(
                      color: kPrimaryColor,
                      textColor: kTextColor,
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