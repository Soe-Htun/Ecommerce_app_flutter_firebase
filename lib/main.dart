import 'package:ecommerce_app_flutter_firebase/constants.dart';
import 'package:ecommerce_app_flutter_firebase/screens/welcomescreen.dart';
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
        primarySwatch: Palatte.kColor,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kBackgroundColor, displayColor: kBackgroundColor)
    ),
      // initialRoute: "/",
      defaultTransition: Transition.rightToLeft,

      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (ctx, snapShot) {
      //     if(snapShot.hasData) {
      //       return HomePage();
      //     } else {
      //       return const Login();
      //     }
      //   },
      // )

      home: const WelcomeScreen(),
      // getPages: [
      //   GetPage(name: "/", page: () => const WelcomeScreen()),
      //   GetPage(name: "/login", page: () => const Login()),
      //   GetPage(name: "/signUp", page: () => const SignUp()),
      //   GetPage(name: "/home", page: () => HomeScreen()),
      // ],
    );
  }
}

class Palatte {
  static const MaterialColor kColor = MaterialColor(
    0xFF0C9869,
     <int, Color> {
      50: Color(0xFF0C9869),
      100: Color(0xFF0C9869),
      200: Color(0xFF0C9869),
      300: Color(0xFF0C9869),
      400: Color(0xFF0C9869),
      500: Color(0xFF0C9869),
      600: Color(0xFF0C9869),
      700: Color(0xFF0C9869),
      800: Color(0xFF0C9869),
      900: Color(0xFF0C9869) 
    }
  );
}
