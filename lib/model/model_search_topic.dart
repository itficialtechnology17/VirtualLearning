// To parse this JSON data, do
//
//     final modelSearchTopic = modelSearchTopicFromJson(jsonString);

import 'dart:convert';

import 'model_question.dart';

List<ModelSearchTopic> modelSearchTopicFromJson(String str) =>
    List<ModelSearchTopic>.from(
        json.decode(str).map((x) => ModelSearchTopic.fromJson(x)));

String modelSearchTopicToJson(List<ModelSearchTopic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSearchTopic {
  ModelSearchTopic({
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
    this.isBookmark,
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
  int isBookmark;
  Content content;
  int isFavorite;

  factory ModelSearchTopic.fromJson(Map<String, dynamic> json) =>
      ModelSearchTopic(
        id: json["id"],
        name: json["name"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        icon: json["icon"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        color: json["color"],
        image: json["image"],
        isBookmark: json["is_bookmark"] == null ? null : json["is_bookmark"],
        content: Content.fromJson(json["content"]),
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minutes": minutes == null ? null : minutes,
        "icon": icon,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "color": color,
        "image": image,
        "is_bookmark": isBookmark == null ? null : isBookmark,
        "content": content.toJson(),
        "is_favorite": isFavorite,
      };
}

class Content {
  Content({
    this.id,
    this.file,
    this.videoId,
    this.video,
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
  });

  int id;
  String file;
  String videoId;
  String video;
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
        video: json["video"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "video_id": videoId,
        "video": video,
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
      };
}
