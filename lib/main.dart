import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
//import 'package:carousel_slider/carousel_slider.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("해양IT융합기술연구소"),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: Drawer(),
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
                      hintStyle: TextStyle(height: 3.2)),
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
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 20, left: 20, top: 230),
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "최근 연구 과제",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "HangeulNuri",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
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
              )),
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
          Row(
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
                          print("연구과제");
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
          ),
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
        ])));
  }
}
