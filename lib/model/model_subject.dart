import 'dart:convert';

List<ModelSubject> modelSubjectFromJson(String str) => List<ModelSubject>.from(
    json.decode(str).map((x) => ModelSubject.fromJson(x)));

String modelSubjectToJson(List<ModelSubject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubject {
  ModelSubject({
    this.id,
    this.subjectId,
    this.standardId,
    this.description,
    this.createdOn,
    this.name,
    this.displayName,
    this.icon,
    this.status,
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

  factory ModelSubject.fromJson(Map<String, dynamic> json) => ModelSubject(
        id: json["id"],
        subjectId: json["subject_id"],
        standardId: json["standard_id"],
        description: json["description"],
        createdOn: DateTime.parse(json["created_on"]),
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
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
      };
}
