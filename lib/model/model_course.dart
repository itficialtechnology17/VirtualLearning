import 'dart:convert';

List<ModelCourse> modelCourseFromJson(String str) => List<ModelCourse>.from(
    json.decode(str).map((x) => ModelCourse.fromJson(x)));

String modelCourseToJson(List<ModelCourse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelCourse {
  ModelCourse({
    this.id,
    this.name,
    this.displayName,
    this.boardId,
    this.icon,
    this.status,
    this.createdOn,
  });

  int id;
  String name;
  String displayName;
  String boardId;
  String icon;
  int status;
  bool selected = false;
  DateTime createdOn;

  factory ModelCourse.fromJson(Map<String, dynamic> json) => ModelCourse(
        id: json["id"],
        name: json["name"],
        displayName: json["display_name"],
        boardId: json["board_id"],
        icon: json["icon"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_name": displayName,
        "board_id": boardId,
        "icon": icon,
        "status": status,
        "created_on": createdOn.toIso8601String(),
      };
}
