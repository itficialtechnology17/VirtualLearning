// To parse this JSON data, do
//
//     final modelSubscription = modelSubscriptionFromJson(jsonString);

import 'dart:convert';

List<ModelSubscription> modelSubscriptionFromJson(String str) =>
    List<ModelSubscription>.from(
        json.decode(str).map((x) => ModelSubscription.fromJson(x)));

String modelSubscriptionToJson(List<ModelSubscription> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubscription {
  ModelSubscription({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdOn,
    this.subscribed,
  });

  int id;
  String title;
  String description;
  String status;
  DateTime createdOn;
  int subscribed;
  bool isLoading = false;

  factory ModelSubscription.fromJson(Map<String, dynamic> json) =>
      ModelSubscription(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        subscribed: json["subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "subscribed": subscribed,
      };
}
