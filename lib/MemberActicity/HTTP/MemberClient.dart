import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<MemberData>> fetchPost() async {
  final response =
      await http.post('http://210.119.107.82:8080/members/android/MemberALL/');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    print(list);
    var data = list.map((element) => MemberData.fromJson(element)).toList();
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class MemberData {
  var mid;
  // ignore: non_constant_identifier_names
  var name_ko;
  // ignore: non_constant_identifier_names
  var name_en;
  // ignore: non_constant_identifier_names
  var department_ko;
  // ignore: non_constant_identifier_names
  var department_en;
  // ignore: non_constant_identifier_names
  var position_ko;
  // ignore: non_constant_identifier_names
  var position_en;
  var phone;
  var email;
  var photo;

  MemberData(
      {this.mid,
      // ignore: non_constant_identifier_names
      this.name_ko,
      // ignore: non_constant_identifier_names
      this.name_en,
      // ignore: non_constant_identifier_names
      this.department_ko,
      // ignore: non_constant_identifier_names
      this.department_en,
      // ignore: non_constant_identifier_names
      this.position_ko,
      // ignore: non_constant_identifier_names
      this.position_en,
      this.phone,
      this.email,
      this.photo});

  factory MemberData.fromJson(Map<String, dynamic> json) {
    return MemberData(
      mid: json['mid'],
      name_ko: json['name_ko'],
      name_en: json['name_en'],
      department_ko: json['department_ko'],
      department_en: json['department_en'],
      position_ko: json['position_ko'],
      position_en: json['position_en'],
      phone: json['phone'],
      email: json['email'],
      photo: json['photo'],
    );
  }
}
