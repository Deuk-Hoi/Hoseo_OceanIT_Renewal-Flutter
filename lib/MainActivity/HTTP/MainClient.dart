import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<Data>> fetchPost() async {
  final response =
  await http.post('http://210.119.107.82:8080/members/android/MemberALL/');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    print(list);
    var data = list.map((element) => FieldData.fromJson(element)).toList();
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}