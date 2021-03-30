// To parse this JSON data, do
//
//     final modelContactTime = modelContactTimeFromJson(jsonString);

import 'dart:convert';

List<String> modelContactTimeFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String modelContactTimeToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
