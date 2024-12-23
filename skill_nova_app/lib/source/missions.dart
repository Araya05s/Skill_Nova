import 'package:flutter/material.dart';

import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  _MissionsScreenState createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {

  double Value = 0.72;
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
                  decoration: const BoxDecoration(color: Color(0xff782A8C), borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  )
                  ),
                  height: 241,
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
                                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20), color: Colors.white),
                                child: const Icon(Icons.notifications, color: Colors.black,size: 20,),
                              ),
                              const SizedBox(height: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5), color: Colors.white),
                                          child: const Icon(Icons.arrow_back, color: Colors.black, size: 30,)
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.15),
                                      const Text(
                                        "Statistik Misi",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.59,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Column(
                                          children: [
                                            Text(
                                              "Misi Selesai",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                              "15",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xffF2D049)
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                                        const Column(
                                          children: [
                                            Text(
                                              "Misi Aktif",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "'Belajar Javascript'",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                  color: Color(0xffF2D049)
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              "5 / 29 Langkah Selesai",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
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
                                MaterialPageRoute(builder: (context) => const UsertoAdmin(isAdminMode: false,)),
                              );
                            },
                            child: Column(
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
                                      fontSize: 12,
                                  ),
                                ),
                                Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100,
                                      height: 15,
                                      child: LinearProgressIndicator(
                                        backgroundColor: const Color(0xffD9D9D9),
                                        valueColor: const AlwaysStoppedAnimation(Color(0xff5271FF)),
                                        value: Value,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const Align(
                                      widthFactor: 1.40, alignment: Alignment.topCenter,
                                      child: Text("14.4K / 20K XP",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff782A8C)
                                        ),
                                      ), ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "6x Learning Streak",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                const Text(
                                  "4 / 9 misi selesai",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                            decoration: BoxDecoration(color: const Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                            width: 150,
                            height: 56,
                            child: Column(
                              children: [
                                const Text(
                                    "Learning Streak aktif",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.0025,),
                                const Text(
                                  "6x",
                                  style: TextStyle(
                                    color: Color(0xFFF2D049),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                            decoration: BoxDecoration(color: const Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                            width: 160,
                            height: 56,
                            child: const Column(
                              children: [
                                Text(
                                  "Deadline Misi Terdekat",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "12 Jam 30 Menit",
                                  style: TextStyle(
                                    color: Color(0xFFFF0025),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
                        child: const Text(
                          "Misi-Misi Aktif",
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
                          margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: const Color(0xff5271FF), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/loop-mission1.png",
                                          width: 100,
                                          height: 120,
                                        ),
                                        const SizedBox(width: 6,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: const Text(
                                                "Belajar Looping dalam Python",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    "Kategori : ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    "Sains Komputer",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5,),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Text(
                                                "2 / 7 Materi Terselesaikan",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Color(0xFFF2D049),
                                                  ),
                                                  Text(
                                                    " + 1.430 XP",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 10,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                                SizedBox(
                                                  width: 99,
                                                  height: 25,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color(0xffEEF1FF),
                                                        foregroundColor: const Color(0xff5271FF),
                                                        textStyle: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                    ),
                                                    child: const Text("AKTIF"),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.011,),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: const Color(0xff5271FF), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Mission-2.png",
                                          width: 100,
                                          height: 120,
                                        ),
                                        const SizedBox(width: 6,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: const Text(
                                                "Selesaikan 3 pelajaran Seni",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    "Kategori : ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    "Seni",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5,),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Text(
                                                "0 / 7 Materi Terselesaikan",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Color(0xFFF2D049),
                                                  ),
                                                  Text(
                                                    " + 1.360 XP",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 10,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                                SizedBox(
                                                  width: 99,
                                                  height: 25,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color(0xffFFFCEF),
                                                      foregroundColor: const Color(0xffF2D049),
                                                      textStyle: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    child: const Text("BARU"),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.011,),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
                          child: Container(
                              padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: const Color(0xff5271FF), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "images/Mission-3.png",
                                          width: 100,
                                          height: 120,
                                        ),
                                        const SizedBox(width: 6,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: const Text(
                                                "Selesaikan 3 tantangan hari ini",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    "Kategori : ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    "Semua kategori",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 9,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5,),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Text(
                                                "7 / 7 Materi Terselesaikan",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.49,
                                              child: const Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Color(0xFFF2D049),
                                                  ),
                                                  Text(
                                                    " + 1.200 XP",
                                                    style: TextStyle(
                                                      color: Color(0xFFF2D049),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 10,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                                SizedBox(
                                                  width: 99,
                                                  height: 25,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color(0xffEFFAEB),
                                                        foregroundColor: const Color(0xff60E932),
                                                        textStyle: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                    ),
                                                    child: const Text("SELESAI"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.003,),
                  const Text(
                    "Terus lanjutkan belajarnya! Tinggal 3 misi lagi sebelum kamu mencapai Level 28, lho!",
                    style: TextStyle(
                        fontSize: 8.25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff5271FF)
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.85,
                        height: 15,
                        child: LinearProgressIndicator(
                          backgroundColor: const Color(0xffD9D9D9),
                          valueColor: const AlwaysStoppedAnimation(Color(0xff5271FF)),
                          value: Value,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Align(
                        widthFactor: 1.40,
                        child: Text("14.4K / 20K XP",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff782A8C)
                          ),
                        ), ),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  const Text(
                    "Level 27",
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5271FF)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
