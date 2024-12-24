import 'package:flutter/material.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/users.dart';
import 'package:skill_nova_app/source/Admin/Admin_homepage.dart';
import 'package:skill_nova_app/source/Authenticator/signup.dart';
import 'package:skill_nova_app/source/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isChecked = false;
  bool isLogintrue = false;

  Future<bool> isLoginUserAdmin() async {
    var user = await SkillNovaDatabase.instance.getUser(username.text.trim(), columns: ["isAdmin"]);
    return user?.isAdmin ?? false;
  }


  void login() async {
    var result = await SkillNovaDatabase.instance.authenticate(
      Users(
        usrName: username.text.trim(), 
        password: password.text.trim(), 
        isAdmin: false
      ),
    );

    if (result) {
      final isAdmin = await isLoginUserAdmin();
      if (isAdmin) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Admin_HomePage()),);
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()),);
      }
    } else {
      setState(() {
        isLogintrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 55,
                    decoration: BoxDecoration(color: Color(0xffCCBEF1), borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          icon: Icon(Icons.account_circle),
                        ),
                        controller: username,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 55,
                    decoration: BoxDecoration(color: Color(0xffCCBEF1), borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          icon: Icon(Icons.lock),
                        ),
                        controller: password,
                      ),
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: Text("Remember me"),
                    leading: Checkbox(
                        value: isChecked,
                        onChanged: (value){
                          setState(() {
                            isChecked = !isChecked;
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff5271FF),
                            elevation: 5
                        ),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()),
                            );
                          },
                          child: const Text("SIGN UP")
                      )
                    ],
                  ),
        
                  isLogintrue? Text(
                      "Username or Password is incorrect",
                    style: TextStyle(
                      color: Colors.red.shade900
                    ),
                  ):const SizedBox()
                ],
              ),
            )
        ),
      ),
    );
  }
}
