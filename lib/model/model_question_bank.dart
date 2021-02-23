// To parse this JSON data, do
//
//     final modeQuestionBank = modeQuestionBankFromJson(jsonString);

import 'dart:convert';

import 'package:virtual_learning/model/model_question.dart';

List<ModeQuestionBank> modeQuestionBankFromJson(String str) =>
    List<ModeQuestionBank>.from(
        json.decode(str).map((x) => ModeQuestionBank.fromJson(x)));

String modeQuestionBankToJson(List<ModeQuestionBank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModeQuestionBank {
  ModeQuestionBank({
    this.id,
    this.title,
    this.question,
  });

  int id;
  int title;
  List<ModelQuestion> question;

  factory ModeQuestionBank.fromJson(Map<String, dynamic> json) =>
      ModeQuestionBank(
        id: json["id"],
        title: json["title"],
        question: List<ModelQuestion>.from(
            json["question"].map((x) => ModelQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "question": List<dynamic>.from(question.map((x) => x.toJson())),
      };
}
