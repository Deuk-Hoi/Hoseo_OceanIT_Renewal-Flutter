import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<FieldData>> fetchPost() async {
  final response =
      await http.get('http://210.119.107.82:8080/research/android/fields/');

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var data = list.map((element) => FieldData.fromJson(element)).toList();
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class FieldData {
  var rfid;
  // ignore: non_constant_identifier_names
  var research_name_ko;
  // ignore: non_constant_identifier_names
  var research_name_en;
  // ignore: non_constant_identifier_names
  var business_name_ko;
  // ignore: non_constant_identifier_names
  var business_name_en;
  // ignore: non_constant_identifier_names
  var department_name_ko;
  // ignore: non_constant_identifier_names
  var department_name_en;
  // ignore: non_constant_identifier_names
  var subjectivity_agency_ko;
  // ignore: non_constant_identifier_names
  var subjectivity_agency_en;
  // ignore: non_constant_identifier_names
  var support_agency_ko;
  // ignore: non_constant_identifier_names
  var support_agency_en;
  // ignore: non_constant_identifier_names
  var participation_agency_ko;
  // ignore: non_constant_identifier_names
  var participation_agency_en;
  // ignore: non_constant_identifier_names
  var research_goal_ko;
  // ignore: non_constant_identifier_names
  var research_goal_en;
  // ignore: non_constant_identifier_names
  var research_content_ko;
  // ignore: non_constant_identifier_names
  var research_content_en;
  // ignore: non_constant_identifier_names
  var expectation_result_ko;
  // ignore: non_constant_identifier_names
  var expectation_result_en;
  // ignore: non_constant_identifier_names
  var research_manager_ko;
  // ignore: non_constant_identifier_names
  var research_manager_en;
  // ignore: non_constant_identifier_names
  var research_belong_ko;
  // ignore: non_constant_identifier_names
  var research_belong_en;
  // ignore: non_constant_identifier_names
  var date_start;
  // ignore: non_constant_identifier_names
  var date_end;

  FieldData({
    this.rfid,
    // ignore: non_constant_identifier_names
    this.research_name_ko,
    // ignore: non_constant_identifier_names
    this.research_name_en,
    // ignore: non_constant_identifier_names
    this.business_name_ko,
    // ignore: non_constant_identifier_names
    this.business_name_en,
    // ignore: non_constant_identifier_names
    this.department_name_ko,
    // ignore: non_constant_identifier_names
    this.department_name_en,
    // ignore: non_constant_identifier_names
    this.subjectivity_agency_ko,
    // ignore: non_constant_identifier_names
    this.subjectivity_agency_en,
    // ignore: non_constant_identifier_names
    this.support_agency_ko,
    // ignore: non_constant_identifier_names
    this.support_agency_en,
    // ignore: non_constant_identifier_names
    this.participation_agency_ko,
    // ignore: non_constant_identifier_names
    this.participation_agency_en,
    // ignore: non_constant_identifier_names
    this.research_goal_ko,
    // ignore: non_constant_identifier_names
    this.research_goal_en,
    // ignore: non_constant_identifier_names
    this.research_content_ko,
    // ignore: non_constant_identifier_names
    this.research_content_en,
    // ignore: non_constant_identifier_names
    this.expectation_result_ko,
    // ignore: non_constant_identifier_names
    this.expectation_result_en,
    // ignore: non_constant_identifier_names
    this.research_manager_ko,
    // ignore: non_constant_identifier_names
    this.research_manager_en,
    // ignore: non_constant_identifier_names
    this.research_belong_ko,
    // ignore: non_constant_identifier_names
    this.research_belong_en,
    // ignore: non_constant_identifier_names
    this.date_start,
    // ignore: non_constant_identifier_names
    this.date_end,
  });

  factory FieldData.fromJson(Map<String, dynamic> json) {
    return FieldData(
      rfid: json['rfid'],
      research_name_ko: json['research_name_ko'],
      research_name_en: json['research_name_en'],
      business_name_ko: json['business_name_ko'],
      business_name_en: json['business_name_en'],
      department_name_ko: json['department_name_ko'],
      department_name_en: json['department_name_en'],
      subjectivity_agency_ko: json['subjectivity_agency_ko'],
      subjectivity_agency_en: json['subjectivity_agency_en'],
      support_agency_ko: json['support_agency_ko'],
      support_agency_en: json['support_agency_en'],
      participation_agency_ko: json['participation_agency_ko'],
      participation_agency_en: json['participation_agency_en'],
      research_goal_ko: json['research_goal_ko'],
      research_goal_en: json['research_goal_en'],
      research_content_ko: json['research_content_ko'],
      research_content_en: json['research_content_en'],
      expectation_result_ko: json['expectation_result_ko'],
      expectation_result_en: json['expectation_result_en'],
      research_manager_ko: json['research_manager_ko'],
      research_manager_en: json['research_manager_en'],
      research_belong_ko: json['research_belong_ko'],
      research_belong_en: json['research_belong_en'],
      date_start: json['date_start'],
      date_end: json['date_end'],
    );
  }
}
