import 'package:flutter/material.dart';
import 'package:hoseo_oceanit2/Login.dart';

Widget drawerList(dynamic context, String menutitle, IconData icons,
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

Widget drawerLayout(dynamic context) {
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
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 45),
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
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
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
                      drawerList(context, "Home", Icons.home),
                      drawerList(context, "연구성과", Icons.biotech),
                      drawerList(context, "연구과제", Icons.create),
                      drawerList(context, "연구인력", Icons.group),
                      drawerList(context, "문의게시판", Icons.question_answer),
                      drawerList(context, "PC 버전", Icons.computer),
                      drawerList(context, "수중관측", Icons.waves),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment(-1.0, 1.0),
              margin: EdgeInsets.only(bottom: 10),
              child: drawerList(context, "로그인", Icons.power_settings_new,
                  iconColor: Colors.blue),
            ),
          ],
        ),
      ));
}
