// To parse this JSON data, do
//
//     final modelPrice = modelPriceFromJson(jsonString);

import 'dart:convert';

List<ModelPrice> modelPriceFromJson(String str) =>
    List<ModelPrice>.from(json.decode(str).map((x) => ModelPrice.fromJson(x)));

String modelPriceToJson(List<ModelPrice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelPrice {
  ModelPrice({
    this.id,
    this.planId,
    this.standardId,
    this.subjectPrice,
    this.coursePrice,
    this.createdOn,
  });

  int id;
  String planId;
  String standardId;
  String subjectPrice;
  String coursePrice;
  DateTime createdOn;

  factory ModelPrice.fromJson(Map<String, dynamic> json) => ModelPrice(
        id: json["id"],
        planId: json["plan_id"],
        standardId: json["standard_id"],
        subjectPrice: json["subject_price"],
        coursePrice: json["course_price"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "standard_id": standardId,
        "subject_price": subjectPrice,
        "course_price": coursePrice,
        "created_on": createdOn.toIso8601String(),
      };
}
