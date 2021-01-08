import 'dart:convert';

List<ModelBookmark> modelBookmarkFromJson(String str) =>
    List<ModelBookmark>.from(
        json.decode(str).map((x) => ModelBookmark.fromJson(x)));

String modelBookmarkToJson(List<ModelBookmark> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBookmark {
  ModelBookmark({
    this.id,
    this.subjectId,
    this.standardId,
    this.description,
    this.createdOn,
    this.name,
    this.displayName,
    this.icon,
    this.status,
    this.favourites,
  });

  int id;
  String subjectId;
  String standardId;
  dynamic description;
  DateTime createdOn;
  String name;
  String displayName;
  String icon;
  int status;
  List<Favourite> favourites;

  factory ModelBookmark.fromJson(Map<String, dynamic> json) => ModelBookmark(
        id: json["id"],
        subjectId: json["subject_id"],
        standardId: json["standard_id"],
        description: json["description"],
        createdOn: DateTime.parse(json["created_on"]),
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
        favourites: List<Favourite>.from(
            json["favourites"].map((x) => Favourite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "standard_id": standardId,
        "description": description,
        "created_on": createdOn.toIso8601String(),
        "name": name,
        "display_name": displayName,
        "icon": icon,
        "status": status,
        "favourites": List<dynamic>.from(favourites.map((x) => x.toJson())),
      };
}

class Favourite {
  Favourite({
    this.id,
    this.name,
    this.minutes,
    this.icon,
    this.chapterId,
    this.status,
    this.createdOn,
    this.content,
    this.isFavorite,
  });

  int id;
  String name;
  String minutes;
  String icon;
  String chapterId;
  int status;
  DateTime createdOn;
  Content content;
  int isFavorite;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"],
        name: json["name"],
        minutes: json["minutes"],
        icon: json["icon"],
        chapterId: json["chapter_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        content: Content.fromJson(json["content"]),
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minutes": minutes,
        "icon": icon,
        "chapter_id": chapterId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "content": content.toJson(),
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
  });

  int id;
  String file;
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
      };
}
