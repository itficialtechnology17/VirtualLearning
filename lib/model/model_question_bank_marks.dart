// To parse this JSON data, do
//
//     final modelQuestionBankMarks = modelQuestionBankMarksFromJson(jsonString);

import 'dart:convert';

List<ModelQuestionBankMarks> modelQuestionBankMarksFromJson(String str) =>
    List<ModelQuestionBankMarks>.from(
        json.decode(str).map((x) => ModelQuestionBankMarks.fromJson(x)));

String modelQuestionBankMarksToJson(List<ModelQuestionBankMarks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelQuestionBankMarks {
  ModelQuestionBankMarks({
    this.id,
    this.file,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.vendorId,
    this.status,
    this.createdOn,
  });

  int id;
  String file;
  String title;
  String type;
  int standardId;
  int subjectId;
  int chapterId;
  int topicId;
  dynamic vendorId;
  int status;
  DateTime createdOn;

  factory ModelQuestionBankMarks.fromJson(Map<String, dynamic> json) =>
      ModelQuestionBankMarks(
        id: json["id"],
        file: json["file"],
        title: json["title"],
        type: json["type"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "title": title,
        "type": type,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
      };
}
