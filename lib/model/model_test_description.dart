// To parse this JSON data, do
//
//     final modelTestDescription = modelTestDescriptionFromJson(jsonString);

import 'dart:convert';

List<ModelTestDescription> modelTestDescriptionFromJson(String str) =>
    List<ModelTestDescription>.from(
        json.decode(str).map((x) => ModelTestDescription.fromJson(x)));

String modelTestDescriptionToJson(List<ModelTestDescription> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTestDescription {
  ModelTestDescription({
    this.id,
    this.title,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.marks,
    this.status,
    this.createdOn,
    this.isGiven,
  });

  int id;
  String title;
  String standardId;
  String subjectId;
  String chapterId;
  dynamic topicId;
  String marks;
  int status;
  DateTime createdOn;
  int isGiven;

  factory ModelTestDescription.fromJson(Map<String, dynamic> json) =>
      ModelTestDescription(
        id: json["id"],
        title: json["title"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        marks: json["marks"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        isGiven: json["is_given"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "marks": marks,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "is_given": isGiven,
      };
}
