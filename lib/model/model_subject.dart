// To parse this JSON data, do
//
//     final modelSubject = modelSubjectFromJson(jsonString);

import 'dart:convert';

List<ModelSubject> modelSubjectFromJson(String str) => List<ModelSubject>.from(
    json.decode(str).map((x) => ModelSubject.fromJson(x)));

String modelSubjectToJson(List<ModelSubject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubject {
  ModelSubject({
    this.id,
    this.subjectId,
    this.standardId,
    this.description,
    this.createdOn,
    this.name,
    this.displayName,
    this.icon,
    this.status,
    this.color1,
    this.color2,
  });

  int id;
  String subjectId;
  String standardId;
  dynamic description;
  DateTime createdOn;
  String name;
  String displayName;
  String icon;
  int status;
  String color1;
  String color2;
  bool isSelected = false;

  factory ModelSubject.fromJson(Map<String, dynamic> json) => ModelSubject(
        id: json["id"],
        subjectId: json["subject_id"],
        standardId: json["standard_id"],
        description: json["description"],
        createdOn: DateTime.parse(json["created_on"]),
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
        color1: json["color_1"],
        color2: json["color_2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "standard_id": standardId,
        "description": description,
        "created_on": createdOn.toIso8601String(),
        "name": name,
        "display_name": displayName,
        "icon": icon,
        "status": status,
        "color_1": color1,
        "color_2": color2,
      };
}
