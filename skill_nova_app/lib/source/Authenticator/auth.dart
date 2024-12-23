import 'package:flutter/material.dart';
import 'package:skill_nova_app/source/Authenticator/login.dart';
import 'package:skill_nova_app/source/Authenticator/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            const Text(
              "Authentication",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Authenticate to access Skill Nova App",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffD9D9D9)),
            ), SizedBox(height: MediaQuery.of(context).size.height*0.25,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      elevation: 5
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFFFFF), elevation: 2
                  ),
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),
                  )),
            )
                  ],
                ),
          ),
        ));
  }
}
