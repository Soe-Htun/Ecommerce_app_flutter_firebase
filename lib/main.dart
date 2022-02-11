import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/screens/homepage.dart';
import 'package:ecommerce_app_flutter_firebase/screens/login.dart';
import 'package:ecommerce_app_flutter_firebase/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase?.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // textTheme: Theme.of(context).textTheme.apply(bodyColor: kBackgroundColor, displayColor: kBackgroundColor)
      ),
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,

      // home: const Login(),
      getPages: [
        GetPage(name: "/", page: () => const Login()),
        GetPage(name: "/signUp", page: () => const SignUp()),
        GetPage(name: "/home", page: () => HomePage())
      ],
    );
  }
}
