import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Widget _backgroundImage() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/login.jpg',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
  );
}

Widget _logo() {
  return Container(
    margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 60.0),
    alignment: Alignment.topCenter,
    child: Image.asset(
      'assets/logo.png',
      fit: BoxFit.fill,
    ),
  );
}

Widget _idForm() {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      alignment: Alignment.bottomCenter,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          hintText: "ID",
        ),
      ));
}

Widget _passForm() {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      alignment: Alignment.bottomCenter,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          hintText: "Password",
        ),
        obscureText: true,
      ));
}

Widget _loginBtn() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
    width: double.infinity,
    child: RaisedButton(
      color: Colors.red[400],
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
      onPressed: () {},
      child: Text(
        "LOGIN",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    ),
  );
}

Widget _findIdPass() {
  return Container(
      child: InkWell(
    child: Text(
      "아이디 / 비밀번호 찾기",
      style: TextStyle(
          color: Colors.yellow,
          fontFamily: "HangeulNuri",
          fontWeight: FontWeight.bold),
    ),
    onTap: () => print("hello"),
  ));
}

Widget _signUp() {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: InkWell(
        child: Text(
          "회원가입",
          style: TextStyle(
              color: Colors.yellow,
              fontFamily: "HangeulNuri",
              fontWeight: FontWeight.bold),
        ),
        onTap: () => print("world"),
      ));
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logo(),
              _idForm(),
              _passForm(),
              _loginBtn(),
              _findIdPass(),
              _signUp(),
            ],
          ),
        ],
      ),
    );
  }
}
