import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Welcome_Screen.dart';
import 'package:abcd/main1.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Welcome Back!',style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF014399),
              ),
              ),
   /*         Container(
                height: 250.0,
                child: Image.asset('assets/doctor.jpg'),
              ), */
            SizedBox(
              height: 25.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xFF014399), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xFF014399), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                password=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xFF014399), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xFF014399), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xFF014399),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async{
                    try{
                    //Implement login functionality.
                    final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user!= null){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                      return BMI();
                    },));
                    }
                  }                 
                 catch(e){
                   print(e);
                   }
                  },
                  
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                color: Color(0xFF014399),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    _auth.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return WelcomeScreen();
                    },));
                  },
                  
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log Out',style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'SignUp');
            },
              child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Color(0xFF014399), fontWeight: FontWeight.bold),
                      )
                    ]
                  ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}