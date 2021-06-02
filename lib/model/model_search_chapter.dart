// To parse this JSON data, do
//
//     final modelSearchChapter = modelSearchChapterFromJson(jsonString);

import 'dart:convert';

List<ModelSearchChapter> modelSearchChapterFromJson(String str) =>
    List<ModelSearchChapter>.from(
        json.decode(str).map((x) => ModelSearchChapter.fromJson(x)));

String modelSearchChapterToJson(List<ModelSearchChapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSearchChapter {
  ModelSearchChapter({
    this.id,
    this.name,
    this.standardId,
    this.subjectId,
    this.weightage,
    this.minutes,
    this.status,
    this.createdOn,
  });

  int id;
  String name;
  int standardId;
  int subjectId;
  String weightage;
  String minutes;
  int status;
  DateTime createdOn;

  factory ModelSearchChapter.fromJson(Map<String, dynamic> json) =>
      ModelSearchChapter(
        id: json["id"],
        name: json["name"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        weightage: json["weightage"] == null ? null : json["weightage"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "standard_id": standardId,
        "subject_id": subjectId,
        "weightage": weightage == null ? null : weightage,
        "minutes": minutes == null ? null : minutes,
        "status": status,
        "created_on": createdOn.toIso8601String(),
      };
}
