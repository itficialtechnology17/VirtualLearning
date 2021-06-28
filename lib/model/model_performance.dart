// To parse this JSON data, do
//
//     final modelPerformance = modelPerformanceFromJson(jsonString);

import 'dart:convert';

List<ModelPerformance> modelPerformanceFromJson(String str) =>
    List<ModelPerformance>.from(
        json.decode(str).map((x) => ModelPerformance.fromJson(x)));

String modelPerformanceToJson(List<ModelPerformance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelPerformance {
  ModelPerformance({
    this.id,
    this.name,
    this.displayName,
    this.icon,
    this.status,
    this.color1,
    this.color2,
    this.createdOn,
    this.testAttempt,
    this.testAttempted,
    this.averageTime,
    this.totalQuestion,
    this.correctQuestion,
    this.recentTests,
    this.totalTopics,
    this.topicsLearned,
    this.perfomance,
    this.modelPerformanceColor1,
    this.modelPerformanceColor2,
  });

  int id;
  String name;
  String displayName;
  String icon;
  dynamic status;
  String color1;
  String color2;
  String createdOn;
  int testAttempt;
  int testAttempted;
  int averageTime;
  int totalQuestion;
  int correctQuestion;
  List<RecentTest> recentTests;
  int totalTopics;
  int topicsLearned;
  int perfomance;
  String modelPerformanceColor1;
  String modelPerformanceColor2;

  factory ModelPerformance.fromJson(Map<String, dynamic> json) =>
      ModelPerformance(
        id: json["id"],
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
        color1: json["color1"] == null ? null : json["color1"],
        color2: json["color2"] == null ? null : json["color2"],
        createdOn: json["created_on"],
        testAttempt: json["test_attempt"],
        testAttempted: json["test_attempted"],
        averageTime: json["average_time"],
        totalQuestion: json["total_question"],
        correctQuestion: json["correct_question"],
        recentTests: List<RecentTest>.from(
            json["recent_tests"].map((x) => RecentTest.fromJson(x))),
        totalTopics: json["total_topics"],
        topicsLearned: json["topics_learned"],
        perfomance: json["perfomance"],
        modelPerformanceColor1:
            json["color_1"] == null ? null : json["color_1"],
        modelPerformanceColor2:
            json["color_2"] == null ? null : json["color_2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_name": displayName,
        "icon": icon,
        "status": status,
        "color1": color1 == null ? null : color1,
        "color2": color2 == null ? null : color2,
        "created_on": createdOn,
        "test_attempt": testAttempt,
        "test_attempted": testAttempted,
        "average_time": averageTime,
        "total_question": totalQuestion,
        "correct_question": correctQuestion,
        "recent_tests": List<dynamic>.from(recentTests.map((x) => x.toJson())),
        "total_topics": totalTopics,
        "topics_learned": topicsLearned,
        "perfomance": perfomance,
        "color_1":
            modelPerformanceColor1 == null ? null : modelPerformanceColor1,
        "color_2":
            modelPerformanceColor2 == null ? null : modelPerformanceColor2,
      };
}

class RecentTest {
  RecentTest({
    this.id,
    this.title,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.marks,
    this.instruction,
    this.status,
    this.createdOn,
    this.correctQuestion,
    this.chapterName,
  });

  int id;
  String title;
  String standardId;
  String subjectId;
  String chapterId;
  dynamic topicId;
  String marks;
  String instruction;
  int status;
  DateTime createdOn;
  int correctQuestion;
  String chapterName;

  factory RecentTest.fromJson(Map<String, dynamic> json) => RecentTest(
        id: json["id"],
        title: json["title"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        marks: json["marks"],
        instruction: json["instruction"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        correctQuestion: json["correct_question"],
        chapterName: json["chapter_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "marks": marks,
        "instruction": instruction,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "correct_question": correctQuestion,
        "chapter_name": chapterName,
      };
}
