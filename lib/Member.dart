import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // 영어
        const Locale('ko'), // 한국어
      ],
    );
  }
}

class Researcher extends StatefulWidget {
  @override
  _ResearcherState createState() => _ResearcherState();
}

class _ResearcherState extends State<Researcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("연구 인력")),
      body: ListWheelScrollView(
          itemExtent: 250,
          diameterRatio: 2.5,
          children: [for (int i = 0; i < 10; i++) Members(index: i + 1)]),
    );
  }
}

class Members extends StatelessWidget {
  final int index;

  Members({@required this.index, Key key}) : super(key: key);

  static const colors = [
    Colors.pink,
    Colors.indigo,
    Colors.grey,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "김해양아이티",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("교수"),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text("호서대학교"),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("정보통신공학부"),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 120,
                      margin: EdgeInsets.only(right: 20.0, top: 10),
                      color: Colors.blue,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tel.",
                                style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("041-000-0000")
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Email.",
                                style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("hlko@hoseo.edu")
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: SizedBox(
                    height: 20.0,
                    child: Container(color: Colors.purple[300]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
