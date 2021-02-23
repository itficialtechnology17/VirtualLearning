// To parse this JSON data, do
//
//     final modelPdf = modelPdfFromJson(jsonString);

import 'dart:convert';

List<ModelPdf> modelPdfFromJson(String str) =>
    List<ModelPdf>.from(json.decode(str).map((x) => ModelPdf.fromJson(x)));

String modelPdfToJson(List<ModelPdf> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelPdf {
  ModelPdf({
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
  dynamic topicId;
  dynamic vendorId;
  int status;
  DateTime createdOn;

  factory ModelPdf.fromJson(Map<String, dynamic> json) => ModelPdf(
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
