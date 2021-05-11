import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<MainData> fetchPost() async {
  final response =
  await http.post('http://210.119.107.82:80/android');

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return MainData.fromJson(json);
  } else {
    throw Exception('Failed to load data');
  }
}

class MainData {
  // ignore: non_constant_identifier_names
  var research_name_ko;
// ignore: non_constant_identifier_names
  var research_content_ko;

MainData({
  // ignore: non_constant_identifier_names
    this.research_name_ko,
  // ignore: non_constant_identifier_names
    this.research_content_ko,

});

factory MainData.fromJson(Map<String, dynamic> json) {
return MainData(
    research_name_ko: json['research_name_ko'],
    research_content_ko: json['research_content_ko']

);
}
}