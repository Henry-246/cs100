import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  final String id;
  final String name;
  final String level;
  final String code;
  final int totalResources;
  final int semester;
  final String thumbnail;
  CourseModel({
    required this.id,
    required this.name,
    required this.level,
    required this.code,
    this.totalResources = 0,
    required this.semester,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'level': level,
      'code': code,
      'totalResources': totalResources,
      'semester': semester,
      'thumbnail': thumbnail,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] as String,
      name: map['name'] as String,
      level: map['level'] as String,
      code: map['code'] as String,
      totalResources: map['totalResources'] as int,
      semester: map['semester'] as int,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
