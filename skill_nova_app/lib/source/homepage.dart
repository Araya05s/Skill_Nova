import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5, left: 20, right: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xff782A8C), borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),
            height: 174,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20), color: Colors.white),
                          child: Icon(Icons.notifications, color: Colors.black,size: 20,),
                        ),
                        SizedBox(height: 20,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Halo, David Hamilton!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            Text("Apa yang ingin dipelajari hari ini?",
                              style: TextStyle(
                                  color: Color(0xff5271FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [

                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 60,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("images/Profile.png", width: 69, height: 69,),
                        const Text(
                          "David Hamilton",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                        const Text(
                          "Level 27",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 14,
                          decoration: BoxDecoration(color: Color(0xffd9d9d9), borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "19.1K / 20K XP",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff782A8C)
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "6x Learning Streak",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          ),
                        ),
                        SizedBox(height: 4,),
                        const Text(
                          "4 / 9 misi selesai",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 90),
                  child: const Text(
                    "Rekomendasi kursus untuk kamu",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  )
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2, right: 30, left: 30),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xff5271FF), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "images/Backend-Development.png",
                                    width: 100,
                                  ),
                                  SizedBox(width: 6,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Sains Komputer",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: const Text(
                                          "Skills yang didapat: ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: const Text(
                                          "Software Engineering, Application Development, Computer Programming, Security Engineerin",
                                          style: TextStyle(
                                            color: Color(0xffD9D9D9),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: const Text(
                                          "Sains komputer · Professional Certificate · 3 – 6 Bulan",
                                          style: TextStyle(
                                            color: Color(0xffD9D9D9),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2, right: 30, left: 30),
                    child: Container(
                        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Color(0xff5271FF), borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/Arts.png",
                                      width: 100,
                                    ),
                                    SizedBox(width: 6,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Seni dan Tari",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Skills yang didapat: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Menggambar dasar, Pemahaman warna, Kreativitas, Pengetahuan alat, Material seni",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Seni · Professional Certificate · 3 – 6 Bulan",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2, right: 30, left: 30),
                    child: Container(
                        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Color(0xff5271FF), borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/Economy.png",
                                      width: 100,
                                    ),
                                    SizedBox(width: 6,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Bisnis dan Ekonomi",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Skills yang didapat: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Analisis data, Keuangan, Negosiasi, Kewirausahaan, Hukum bisnis",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Bisnis · Professional Certificate · 3 – 6 Bulan",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2, right: 30, left: 30),
                    child: Container(
                        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Color(0xff5271FF), borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/Language.png",
                                      width: 100,
                                    ),
                                    SizedBox(width: 6,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Keterampilan Bahasa",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Skills yang didapat: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Pemahaman Berbicara, Mendengar, Membaca, Menulis, Kosakata dan Grammar, Tata Bahasa",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 9,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.49,
                                          child: const Text(
                                            "Bahasa · Professional Certificate · 3 – 6 Bulan",
                                            style: TextStyle(
                                              color: Color(0xffD9D9D9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Color(0xff782A8C),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_filled,

                size: 40,
              )
          ),
          BottomNavigationBarItem(
              label: "Missions",
              icon: ImageIcon(
                AssetImage("icons/Mission-icon.png"),
                size: 40,
              )
          ),
          BottomNavigationBarItem(
              label: "Challenges",
              icon: ImageIcon(
                AssetImage("icons/Challenges-icon.png"),
                size: 40,
              )
          ),
        ],
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        selectedItemColor: Color(0xff5271FF),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold
        ),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
