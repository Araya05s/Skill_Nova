import 'package:flutter/material.dart';
import 'bottombar.dart';

class MissionsScreen extends StatefulWidget {
  @override
  _MissionsScreenState createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {

  double Value = 0.72;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                    child: Icon(Icons.arrow_back, color: Colors.black, size: 30,)
                                ),
                                SizedBox(width: 70),
                                Text(
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
                                  Column(
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
                                  SizedBox(width: 55,),
                                  Column(
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
                    const SizedBox(width:27,),
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
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                      decoration: BoxDecoration(color: Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                      width: 160,
                      height: 56,
                      child: Column(
                        children: [
                          Text(
                              "Learning Streak aktif",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            "7x",
                            style: TextStyle(
                              color: Color(0xFFF2D049),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      padding: EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                      decoration: BoxDecoration(color: Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                      width: 160,
                      height: 56,
                      child: Column(
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
                  padding: const EdgeInsets.only(right: 223),
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
                                      const Text(
                                        "Belajar Looping dalam Python",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Kategori : ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 9,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const Text(
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
                                      SizedBox(height: 5,),
                                      Container(
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
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Color(0xFFF2D049),
                                              ),
                                            ),
                                            const Text(
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
                                          SizedBox(width: 105,),
                                          Container(
                                            width: 99,
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text("AKTIF"),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color(0xffEEF1FF),
                                                  foregroundColor: Color(0xff5271FF),
                                                  textStyle: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                              ),
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
              const SizedBox(height: 10,),
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
                                      const Text(
                                        "Belajar Looping dalam Python",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Kategori : ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 9,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const Text(
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
                                      SizedBox(height: 5,),
                                      Container(
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
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Color(0xFFF2D049),
                                              ),
                                            ),
                                            const Text(
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
                                          SizedBox(width: 105,),
                                          Container(
                                            width: 99,
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text("BARU"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(0xffFFFCEF),
                                                foregroundColor: Color(0xffF2D049),
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
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
              const SizedBox(height: 10,),
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
                                      const Text(
                                        "Belajar Looping dalam Python",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.49,
                                        child: Row(
                                          children: [
                                            const Text(
                                              "Kategori : ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 9,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const Text(
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
                                      SizedBox(height: 5,),
                                      Container(
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
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Color(0xFFF2D049),
                                              ),
                                            ),
                                            const Text(
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
                                          SizedBox(width: 105,),
                                          Container(
                                            width: 99,
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text("SELESAI"),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color(0xffEFFAEB),
                                                  foregroundColor: Color(0xff60E932),
                                                  textStyle: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                              ),
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
              SizedBox(height: 2,),
              Text(
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
              SizedBox(height: 2,),
              Text(
                "Level 27",
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5271FF)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
