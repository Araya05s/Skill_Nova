import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {

  double Value = 0.72;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 3,),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20), color: Colors.white),
                                child: const Icon(Icons.notifications, color: Colors.black,size: 20,),
                              ),
                              const SizedBox(height: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5), color: Colors.white),
                                          child: const Icon(Icons.arrow_back, color: Colors.black, size: 30,)
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                                      const Column(
                                        children: [
                                          Text(
                                            "Tantangan",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            "Progress Tantangan",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                            ],
                          ),
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
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                                decoration: BoxDecoration(color: const Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                                width: MediaQuery.of(context).size.width*0.4,
                                height: 75,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tantangan Selesai Hari Ini",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      "12",
                                      style: TextStyle(
                                        color: Color(0xFFF2D049),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                              Container(
                                padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                                decoration: BoxDecoration(color: const Color(0xFFAF40CC), borderRadius: BorderRadius.circular(5)),
                                width: MediaQuery.of(context).size.width*0.4,
                                height: 75,
                                child: const Column(
                                  children: [
                                    Text(
                                      "Total Tantangan Selesai",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "27",
                                      style: TextStyle(
                                        color: Color(0xFFF2D049),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(right: 223),
                            child: const Text(
                              "Tantangan Baru",
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
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "images/tantangan-1.png",
                                                  width: 100,
                                                  height: 120,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 6,),
                                            Column(
                                              children: [
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.5,
                                                        child: Text(
                                                          "LOOP DI PHYTON",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
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
                                                      child: const Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Tingkat Kesulitan : ",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Muda",
                                                            style: TextStyle(
                                                              color: Color(0xff1EFF2D),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
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
                                                            child: const Text("MULAI"),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.0115,),
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
                                              "images/tantangan-2.png",
                                              width: 100,
                                              height: 120,
                                            ),
                                            const SizedBox(width: 6,),
                                            Column(
                                              children: [
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.5,
                                                        child: Text(
                                                          "TIPE-TIPE KUAS",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
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
                                                      child: const Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Tingkat Kesulitan : ",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Sedang",
                                                            style: TextStyle(
                                                              color: Color(0xffFAFD4C),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
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
                                                            " + 1.650 XP",
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
                                                            child: const Text("MULAI"),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.0115,),
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
                                              "images/tantangan-3.png",
                                              width: 100,
                                              height: 120,
                                            ),
                                            const SizedBox(width: 6,),
                                            Column(
                                              children: [
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.5,
                                                        child: Text(
                                                          "DAILY CONVERSATION",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
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
                                                            "Bahasa",
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
                                                      child: const Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Tingkat Kesulitan : ",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Sulit",
                                                            style: TextStyle(
                                                              color: Color(0xffFF282B),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
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
                                                            " + 2.000 XP",
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
                                                            child: const Text("MULAI"),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
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
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.0025,),
                    const Text(
                      "Terus lanjutkan belajarnya! Selesaikan tantangan untuk mencapai Level selanjutnya!",
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
            )
        ],
      ),
    );
  }
}
