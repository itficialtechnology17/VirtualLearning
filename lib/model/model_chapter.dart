import 'dart:convert';

List<ModelChapter> modelChapterFromJson(String str) => List<ModelChapter>.from(
    json.decode(str).map((x) => ModelChapter.fromJson(x)));

String modelChapterToJson(List<ModelChapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelChapter {
  ModelChapter({
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

  factory ModelChapter.fromJson(Map<String, dynamic> json) => ModelChapter(
        id: json["id"],
        name: json["name"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        weightage: json["weightage"],
        minutes: json["minutes"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "standard_id": standardId,
        "subject_id": subjectId,
        "weightage": weightage,
        "minutes": minutes,
        "status": status,
        "created_on": createdOn.toIso8601String(),
      };
}
