// To parse this JSON data, do
//
//     final modelChapter = modelChapterFromJson(jsonString);

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
    this.note,
  });

  int id;
  String name;
  int standardId;
  int subjectId;
  String weightage;
  String minutes;
  int status;
  DateTime createdOn;
  Note note;

  factory ModelChapter.fromJson(Map<String, dynamic> json) => ModelChapter(
        id: json["id"],
        name: json["name"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        weightage: json["weightage"],
        minutes: json["minutes"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
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
        "note": note == null ? null : note.toJson(),
      };
}

class Note {
  Note({
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

  factory Note.fromJson(Map<String, dynamic> json) => Note(
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
