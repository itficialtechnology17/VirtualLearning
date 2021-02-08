import 'dart:convert';

List<ModelSubscriptionPlan> modelSubscriptionPlanFromJson(String str) =>
    List<ModelSubscriptionPlan>.from(
        json.decode(str).map((x) => ModelSubscriptionPlan.fromJson(x)));

String modelSubscriptionPlanToJson(List<ModelSubscriptionPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubscriptionPlan {
  ModelSubscriptionPlan({
    this.id,
    this.title,
    this.description,
    this.amount,
    this.days,
    this.status,
    this.createdOn,
    this.isSubscribe,
  });

  int id;
  String title;
  String description;
  String amount;
  String days;
  int status;
  DateTime createdOn;
  int isSubscribe;
  bool isLoading = false;

  factory ModelSubscriptionPlan.fromJson(Map<String, dynamic> json) =>
      ModelSubscriptionPlan(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        days: json["days"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        isSubscribe: json["is_subscribe"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "amount": amount,
        "days": days,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "is_subscribe": isSubscribe,
      };
}
