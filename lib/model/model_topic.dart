// To parse this JSON data, do
//
//     final modelTopic = modelTopicFromJson(jsonString);

import 'dart:convert';

import 'package:virtual_learning/model/model_question.dart';

List<ModelTopic> modelTopicFromJson(String str) =>
    List<ModelTopic>.from(json.decode(str).map((x) => ModelTopic.fromJson(x)));

String modelTopicToJson(List<ModelTopic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTopic {
  ModelTopic({
    this.id,
    this.name,
    this.minutes,
    this.icon,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.status,
    this.createdOn,
    this.color,
    this.image,
    this.content,
    this.isFavorite,
  });

  int id;
  String name;
  String minutes;
  String icon;
  int standardId;
  int subjectId;
  String chapterId;
  int status;
  DateTime createdOn;
  String color;
  String image;
  Content content;
  int isFavorite = 0;

  factory ModelTopic.fromJson(Map<String, dynamic> json) => ModelTopic(
        id: json["id"],
        name: json["name"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        icon: json["icon"],
        standardId: json["standard_id"] == null ? null : json["standard_id"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        chapterId: json["chapter_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        color: json["color"],
        image: json["image"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minutes": minutes == null ? null : minutes,
        "icon": icon,
        "standard_id": standardId == null ? null : standardId,
        "subject_id": subjectId == null ? null : subjectId,
        "chapter_id": chapterId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "color": color,
        "image": image,
        "content": content == null ? null : content.toJson(),
        "is_favorite": isFavorite,
      };
}

class Content {
  Content({
    this.id,
    this.file,
    this.videoId,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.vendorId,
    this.status,
    this.createdOn,
    this.question,
    this.video,
  });

  int id;
  String file;
  String video;
  String videoId;
  String title;
  String type;
  int standardId;
  int subjectId;
  int chapterId;
  int topicId;
  dynamic vendorId;
  int status;
  DateTime createdOn;
  List<ModelQuestion> question;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        file: json["file"],
        videoId: json["video_id"],
        title: json["title"],
        type: json["type"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        question: List<ModelQuestion>.from(
            json["question"].map((x) => ModelQuestion.fromJson(x))),
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "video_id": videoId,
        "title": title,
        "type": type,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "question": List<dynamic>.from(question.map((x) => x.toJson())),
        "video": video,
      };
}
