// To parse this JSON data, do
//
//     final modelSearchNote = modelSearchNoteFromJson(jsonString);

import 'dart:convert';

List<ModelSearchNote> modelSearchNoteFromJson(String str) =>
    List<ModelSearchNote>.from(
        json.decode(str).map((x) => ModelSearchNote.fromJson(x)));

String modelSearchNoteToJson(List<ModelSearchNote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSearchNote {
  ModelSearchNote({
    this.id,
    this.file,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
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
  dynamic vendorId;
  int status;
  DateTime createdOn;

  factory ModelSearchNote.fromJson(Map<String, dynamic> json) =>
      ModelSearchNote(
        id: json["id"],
        file: json["file"],
        title: json["title"],
        type: json["type"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
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
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
      };
}
