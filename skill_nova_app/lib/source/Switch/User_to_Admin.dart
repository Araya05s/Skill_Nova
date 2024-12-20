import 'package:flutter/material.dart';

import 'package:skill_nova_app/source/homepage.dart';
import 'package:skill_nova_app/source/Admin/Admin_homepage.dart';

class UsertoAdmin extends StatelessWidget {
  const UsertoAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mau berpindah ke mode admin?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Admin_HomePage()),
                  );
                },
                child: Text(
                  "Pindah Sekarang!",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            Text(
              "Atau...",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xff782A8C), width: 3),
                    backgroundColor: Color(0xffE78AFF),
                    shadowColor: Colors.black,
                    elevation: 2,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  "Balik ke User",
                  style: TextStyle(
                      color: Colors.black87
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
