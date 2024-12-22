import 'package:flutter/material.dart';

import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 20, right: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xff782A8C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 174,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Halo, David Hamilton!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Apa yang ingin dipelajari hari ini?",
                                    style: TextStyle(
                                        color: Color(0xff5271FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.51,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText:
                                              "Cari kursus di SkillNova™.....",
                                          suffixIcon: Container(
                                            height: 10,
                                            decoration: const BoxDecoration(
                                                color: Color(0xff782A8C)),
                                            child: const Icon(Icons.search,
                                                color: Colors.white),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff636363)),
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UsertoAdmin(isAdminMode: false)),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/Profile.png",
                                  width: 69,
                                  height: 69,
                                ),
                                const Text(
                                  "David Hamilton",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                const Text(
                                  "Level 27",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        backgroundColor:
                                            const Color(0xffD9D9D9),
                                        valueColor:
                                            const AlwaysStoppedAnimation(
                                                Color(0xff5271FF)),
                                        value: 0.72,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const Align(
                                      widthFactor: 1.40,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "14.4K / 20K XP",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff782A8C)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "6x Learning Streak",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "4 / 9 misi selesai",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            const EdgeInsets.only(top: 2, right: 30, left: 30),
                        child: const Text(
                          "Rekomendasi kursus untuk kamu",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xff5271FF),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Backend-Development.png",
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            const SizedBox(height: 6),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xff5271FF),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Arts.png",
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            const SizedBox(height: 6),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xff5271FF),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Economy.png",
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            const SizedBox(height: 6),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0xff5271FF),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Language.png",
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                            const SizedBox(height: 6),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.49,
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
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
