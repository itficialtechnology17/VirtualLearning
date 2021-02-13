// To parse this JSON data, do
//
//     final modelWatchHistory = modelWatchHistoryFromJson(jsonString);

import 'dart:convert';

List<ModelWatchHistory> modelWatchHistoryFromJson(String str) =>
    List<ModelWatchHistory>.from(
        json.decode(str).map((x) => ModelWatchHistory.fromJson(x)));

String modelWatchHistoryToJson(List<ModelWatchHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelWatchHistory {
  ModelWatchHistory({
    this.id,
    this.userId,
    this.topicId,
    this.contentId,
    this.minutes,
    this.createdOn,
    this.file,
    this.videoId,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.vendorId,
    this.status,
    this.name,
    this.icon,
  });

  int id;
  int userId;
  int topicId;
  int contentId;
  String minutes;
  DateTime createdOn;
  String file;
  String videoId;
  String title;
  String type;
  int standardId;
  int subjectId;
  String chapterId;
  dynamic vendorId;
  int status;
  String name;
  String icon;
  int isFavorite = 0;

  factory ModelWatchHistory.fromJson(Map<String, dynamic> json) =>
      ModelWatchHistory(
        id: json["id"],
        userId: json["user_id"],
        topicId: json["topic_id"],
        contentId: json["content_id"],
        minutes: json["minutes"],
        createdOn: DateTime.parse(json["created_on"]),
        file: json["file"],
        videoId: json["video_id"],
        title: json["title"],
        type: json["type"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "topic_id": topicId,
        "content_id": contentId,
        "minutes": minutes,
        "created_on": createdOn.toIso8601String(),
        "file": file,
        "video_id": videoId,
        "title": title,
        "type": type,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "vendor_id": vendorId,
        "status": status,
        "name": name,
        "icon": icon,
      };
}
