import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/reg_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/Welcome_Screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: 'Welcome',
      routes: {
        'Welcome':(context)=>WelcomeScreen(),
        'SignIn':(context)=>LoginScreen(),
         'SignUp':(context)=>RegistrationScreen(),
         'Home':(context)=>HomeScreen(),
      },
    );
  }
}