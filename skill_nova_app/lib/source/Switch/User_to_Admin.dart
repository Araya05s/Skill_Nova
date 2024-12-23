import 'package:flutter/material.dart';

import 'package:skill_nova_app/source/homepage.dart';
import 'package:skill_nova_app/source/Admin/Admin_homepage.dart';

class UsertoAdmin extends StatelessWidget {

  final bool isAdminMode;

  const UsertoAdmin({super.key, required this.isAdminMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isAdminMode ? "Mau berpindah ke modul user?" : "Mau berpindah ke modul admin?",
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
                    MaterialPageRoute(builder: (context) => isAdminMode ? HomePage() : Admin_HomePage()),
                  );
                },
                child: Text(
                  isAdminMode ? "Balik ke Modul User" : "Pindah Sekarang!",
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
                  Navigator.pop(context);
                },
                child: Text(
                  isAdminMode ? "Tetap di Mode Admin" : "Tetap di Modul User",
                  style: TextStyle(
                      color: Colors.black87
                  ),
                ),
              ),
            ),
            !isAdminMode ? Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xff782A8C), width: 1),
                    backgroundColor: Colors.red.shade50,
                    shadowColor: Colors.black,
                    elevation: 2,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Logout dari akun user ini" ,
                  style: TextStyle(
                      color: Colors.red.shade700
                  ),
                ),
              ),
            ):SizedBox(),
          ],
        ),
      ),
    );
  }
}
