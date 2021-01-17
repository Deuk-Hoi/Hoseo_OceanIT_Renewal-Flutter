import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/login.dart';
import 'package:hoseo_oceanit2/research_field.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:flutter/services.dart';
//import 'package:carousel_slider/carousel_slider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mainpage",
      theme: ThemeData(
        primaryColor: Color(0xff182034),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _nameCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0.0, -35.0, 0.0),
      margin: EdgeInsets.only(right: 20, left: 20),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 16.0),
            child: CircleAvatar(
              child: Text("득"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "AI 융합대학 컴퓨터공학전공",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "UIT 연구원 김득회",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _researchCard() {
    return Container(
        height: 150.0,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
              splashColor: Colors.blue.withAlpha(60),
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/OceanMain.jpg',
                          fit: BoxFit.fill,
                          width: 140,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        height: double.infinity,
                        margin: EdgeInsets.only(bottom: 20, right: 10),
                        child: ListTile(
                          title: Marquee(
                            child: Text(
                              "분산형 수중관측 제어망 개발",
                              style: TextStyle(fontSize: 20, height: 2.5),
                            ),
                          ),
                          subtitle: Text(
                            "수중환경에서 장시간․실시간 관측 및 제어를 위한 기지국 기반의 수중 관측․제어망 핵심기술 및 체계 구축연구",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                ],
              )),
        ));
  }

  Widget _quickMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(60),
                  onTap: () {
                    print("연구성과");
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.biotech,
                        color: Colors.purple[900],
                        size: 50,
                      ),
                      Text("연구성과")
                    ],
                  ),
                ))),
        Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(60),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResearchField()));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.create,
                        color: Colors.purple[900],
                        size: 50,
                      ),
                      Text("연구과제")
                    ],
                  ),
                ))),
        Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(60),
                  onTap: () {
                    print("연구인력");
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.purple[900],
                        size: 50,
                      ),
                      Text("연구인력")
                    ],
                  ),
                ))),
        Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(60),
                  onTap: () {
                    print("분산형 수증관측망");
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.waves,
                        color: Colors.purple[900],
                        size: 50,
                      ),
                      Text("수증관측")
                    ],
                  ),
                ))),
      ],
    );
  }

  Widget drawerList(String menutitle, IconData icons,
      {Color iconColor = Colors.black54}) {
    return ListTile(
      leading: Icon(
        icons,
        color: iconColor,
      ),
      title: Text(
        menutitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        if (menutitle == "로그인") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
    );
  }

  Widget drawerLayout() {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Drawer(
          child: Stack(
            children: [
              Image.asset(
                "assets/drawer.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 10, top: 50),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "http://cfs5.pie.daum.net/fs/file.php?path=7%2FLzAvMi82Ny85Nw%24%24%2F05.jpg"),
                            )),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 45),
                                child: Row(
                                  children: [
                                    Text(
                                      "호서대학교",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "전임교수",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.indigo[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "이승기",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.indigo[900],
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 30, 0.0),
                    child: Column(
                      children: [
                        drawerList("Home", Icons.home),
                        drawerList("연구성과", Icons.biotech),
                        drawerList("연구과제", Icons.create),
                        drawerList("연구인력", Icons.group),
                        drawerList("문의게시판", Icons.question_answer),
                        drawerList("PC 버전", Icons.computer),
                        drawerList("수중관측", Icons.waves),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment(-1.0, 1.0),
                margin: EdgeInsets.only(bottom: 10),
                child: drawerList("로그인", Icons.power_settings_new,
                    iconColor: Colors.blue),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("해양IT융합기술연구소"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Stack(
          children: [
            Image.asset('assets/OceanMain.jpg'),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 5, right: 5, top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: TextStyle(height: 3.0)),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 30, top: 15),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ],
        ),
        _nameCard(),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "최근 연구 과제",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        ),
        _researchCard(),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 20, bottom: 20),
          child: Text(
            "Quick Menu",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        ),
        _quickMenu(),
        Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.bottomCenter,
          child: Text(
            "Copyright ⓒ 2021. Deuk. All rights reserved.",
            style: TextStyle(
                fontSize: 12,
                fontFamily: "HangeulNuri",
                fontWeight: FontWeight.bold),
          ),
        )
      ])),
      drawer: drawerLayout(),
    );
  }
}
