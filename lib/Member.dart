import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hoseo_oceanit2/MemberActicity/HTTP/MemberClient.dart';

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
  Future<List<MemberData>> memberDatas;
  @override
  void initState() {
    super.initState();
    memberDatas = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    memberDatas = fetchPost();
    memberDatas = fetchPost();
    return Scaffold(
        appBar: AppBar(title: Text("연구 인력")),
        body: Center(
          child: FutureBuilder<List<MemberData>>(
            future: memberDatas,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: ListWheelScrollView(
                      itemExtent: 250,
                      diameterRatio: 2.5,
                      children: [
                        for (final element in snapshot.data) Members(element)
                      ]),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

class Members extends StatelessWidget {
  final dynamic membersElement;

  Members(this.membersElement);
  @override
  Widget build(BuildContext context) {
    print("사진?" + membersElement.photo);
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
                                membersElement.name_ko,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(membersElement.position_ko),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text("호서대학교"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(membersElement.department_ko),
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
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "http://uitlab.cf:8080/images/members/" +
                                    membersElement.photo),
                          )),
                    ),
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
                              Text(membersElement.phone)
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
                              if (membersElement.email == null)
                                Text("oceanIT@hoseo.edu")
                              else
                                Text(membersElement.email)
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
