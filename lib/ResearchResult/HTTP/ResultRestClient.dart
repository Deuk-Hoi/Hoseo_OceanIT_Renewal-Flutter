import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<ResultData>> fetchGet(String query) async {
  final response = await http.get(
      'http://210.119.107.82:8080/research/android/results?classify=$query');
  print("is active?");
  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var data = list.map((element) => ResultData.fromJson(element)).toList();
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class ResultData {
  var rrid;
  var group;
  // ignore: non_constant_identifier_names
  var classify_ko;
  // ignore: non_constant_identifier_names
  var classify_en;
  // ignore: non_constant_identifier_names
  var title_ko;
  // ignore: non_constant_identifier_names
  var title_en;
  // ignore: non_constant_identifier_names
  var academic_ko;
  // ignore: non_constant_identifier_names
  var academic_en;
  // ignore: non_constant_identifier_names
  var writer_ko;
  // ignore: non_constant_identifier_names
  var writer_en;
  // ignore: non_constant_identifier_names
  var media_ko;
  // ignore: non_constant_identifier_names
  var media_en;
  // ignore: non_constant_identifier_names
  var announe_nation_ko;
  // ignore: non_constant_identifier_names
  var announe_nation_en;
  // ignore: non_constant_identifier_names
  var relation_subject_ko;
  // ignore: non_constant_identifier_names
  var relation_subject_en;
  // ignore: non_constant_identifier_names
  var abstract_ko;
  // ignore: non_constant_identifier_names
  var abstract_en;
  // ignore: non_constant_identifier_names
  var date;
  // ignore: non_constant_identifier_names
  var application_num;

  ResultData(
      {this.rrid,
      this.group,
      // ignore: non_constant_identifier_names
      this.classify_ko,
      // ignore: non_constant_identifier_names
      this.classify_en,
      // ignore: non_constant_identifier_names
      this.title_ko,
      // ignore: non_constant_identifier_names
      this.title_en,
      // ignore: non_constant_identifier_names
      this.academic_ko,
      // ignore: non_constant_identifier_names
      this.academic_en,
      // ignore: non_constant_identifier_names
      this.writer_ko,
      // ignore: non_constant_identifier_names
      this.writer_en,
      // ignore: non_constant_identifier_names
      this.media_ko,
      // ignore: non_constant_identifier_names
      this.media_en,
      // ignore: non_constant_identifier_names
      this.announe_nation_ko,
      // ignore: non_constant_identifier_names
      this.announe_nation_en,
      // ignore: non_constant_identifier_names
      this.relation_subject_ko,
      // ignore: non_constant_identifier_names
      this.relation_subject_en,
      // ignore: non_constant_identifier_names
      this.abstract_ko,
      // ignore: non_constant_identifier_names
      this.abstract_en,
      // ignore: non_constant_identifier_names
      this.date,
      // ignore: non_constant_identifier_names
      this.application_num});

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
        rrid: json['rrid'],
        classify_ko: json['classify_ko'], //성과 클래스
        classify_en: json['classify_en'],
        title_ko: json['title_ko'], //제목
        title_en: json['title_en'],
        academic_ko: json['academic_ko'],//학술 대회명
        academic_en: json['academic_en'],
        writer_ko: json['writer_ko'], //저자 발명자
        writer_en: json['writer_en'],
        media_ko: json['media_ko'],//게제지
        media_en: json['media_en'],
        announe_nation_ko: json['announe_nation_ko'],
        announe_nation_en: json['announe_nation_en'],
        relation_subject_ko: json['relation_subject_ko'],
        relation_subject_en: json['relation_subject_en'],
        abstract_ko: json['abstract_ko'],
        abstract_en: json['abstract_en'],
        date: json['date'],
        application_num: json['application_num']); //출원 번호 특허
  }
}
