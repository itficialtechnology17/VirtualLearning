// To parse this JSON data, do
//
//     final modelChapter = modelChapterFromJson(jsonString);

import 'dart:convert';

import 'package:virtual_learning/model/model_topic.dart';

List<ModelChapter> modelChapterFromJson(String str) => List<ModelChapter>.from(
    json.decode(str).map((x) => ModelChapter.fromJson(x)));

String modelChapterToJson(List<ModelChapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelChapter {
  ModelChapter({
    this.id,
    this.name,
    this.standardId,
    this.subjectId,
    this.weightage,
    this.minutes,
    this.status,
    this.createdOn,
    this.note,
    this.topic,
    this.topicCount,
  });

  int id;
  String name;
  int standardId;
  int subjectId;
  String weightage;
  String minutes;
  int status;
  DateTime createdOn;
  Note note;
  List<ModelTopic> topic;
  int topicCount;

  factory ModelChapter.fromJson(Map<String, dynamic> json) => ModelChapter(
        id: json["id"],
        name: json["name"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        weightage: json["weightage"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
        topic: List<ModelTopic>.from(
            json["topic"].map((x) => ModelTopic.fromJson(x))),
        topicCount: json["topic_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "standard_id": standardId,
        "subject_id": subjectId,
        "weightage": weightage,
        "minutes": minutes == null ? null : minutes,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "note": note == null ? null : note.toJson(),
        "topic": List<dynamic>.from(topic.map((x) => x.toJson())),
        "topic_count": topicCount,
      };
}

class Note {
  Note({
    this.id,
    this.file,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.vendorId,
    this.status,
    this.createdOn,
    this.videoId,
    this.topicId,
    this.question,
  });

  int id;
  String file;
  String title;
  NoteType type;
  int standardId;
  int subjectId;
  int chapterId;
  dynamic vendorId;
  int status;
  DateTime createdOn;
  String videoId;
  int topicId;
  dynamic question;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        file: json["file"],
        title: json["title"],
        type: noteTypeValues.map[json["type"]],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        videoId: json["video_id"] == null ? null : json["video_id"],
        topicId: json["topic_id"] == null ? null : json["topic_id"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "title": title,
        "type": noteTypeValues.reverse[type],
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "video_id": videoId == null ? null : videoId,
        "topic_id": topicId == null ? null : topicId,
        "question": question,
      };
}

enum QuestionType { MCQ }

final questionTypeValues = EnumValues({"MCQ": QuestionType.MCQ});

enum NoteType { PDF }

final noteTypeValues = EnumValues({"PDF": NoteType.PDF});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

/*
// To parse this JSON data, do
//
//     final modelChapter = modelChapterFromJson(jsonString);

import 'dart:convert';

import 'package:virtual_learning/model/model_topic.dart';

List<ModelChapter> modelChapterFromJson(String str) => List<ModelChapter>.from(
    json.decode(str).map((x) => ModelChapter.fromJson(x)));

String modelChapterToJson(List<ModelChapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelChapter {
  ModelChapter({
    this.id,
    this.name,
    this.standardId,
    this.subjectId,
    this.weightage,
    this.minutes,
    this.status,
    this.createdOn,
    this.note,
    this.topic,
    this.topicCount,
  });

  int id;
  String name;
  int standardId;
  int subjectId;
  String weightage;
  String minutes;
  int status;
  DateTime createdOn;
  Note note;
  List<ModelTopic> topic;
  int topicCount;

  factory ModelChapter.fromJson(Map<String, dynamic> json) => ModelChapter(
        id: json["id"],
        name: json["name"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        weightage: json["weightage"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
        topic: List<ModelTopic>.from(
            json["topic"].map((x) => ModelTopic.fromJson(x))),
        topicCount: json["topic_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "standard_id": standardId,
        "subject_id": subjectId,
        "weightage": weightage,
        "minutes": minutes == null ? null : minutes,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "note": note == null ? null : note.toJson(),
        "topic": List<dynamic>.from(topic.map((x) => x.toJson())),
        "topic_count": topicCount,
      };
}

class Note {
  Note({
    this.id,
    this.file,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.vendorId,
    this.status,
    this.createdOn,
    this.videoId,
    this.topicId,
    this.question,
  });

  int id;
  String file;
  String title;
  NoteType type;
  int standardId;
  int subjectId;
  int chapterId;
  dynamic vendorId;
  int status;
  DateTime createdOn;
  String videoId;
  int topicId;
  dynamic question;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        file: json["file"],
        title: json["title"],
        type: noteTypeValues.map[json["type"]],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        videoId: json["video_id"] == null ? null : json["video_id"],
        topicId: json["topic_id"] == null ? null : json["topic_id"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "title": title,
        "type": noteTypeValues.reverse[type],
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "video_id": videoId == null ? null : videoId,
        "topic_id": topicId == null ? null : topicId,
        "question": question,
      };
}

class QuestionElement {
  QuestionElement({
    this.id,
    this.question,
    this.solution,
    this.type,
    this.marks,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.videoId,
    this.status,
    this.createdOn,
    this.givenAnswer,
    this.answers,
  });

  int id;
  String question;
  String solution;
  QuestionType type;
  String marks;
  int standardId;
  int subjectId;
  int chapterId;
  int topicId;
  String videoId;
  int status;
  DateTime createdOn;
  int givenAnswer;
  List<Answer> answers;

  factory QuestionElement.fromJson(Map<String, dynamic> json) =>
      QuestionElement(
        id: json["id"] == null ? null : json["id"],
        question: json["question"] == null ? null : json["question"],
        solution: json["solution"] == null ? null : json["solution"],
        type:
            json["type"] == null ? null : questionTypeValues.map[json["type"]],
        marks: json["marks"] == null ? null : json["marks"],
        standardId: json["standard_id"] == null ? null : json["standard_id"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        chapterId: json["chapter_id"] == null ? null : json["chapter_id"],
        topicId: json["topic_id"] == null ? null : json["topic_id"],
        videoId: json["video_id"] == null ? null : json["video_id"],
        status: json["status"] == null ? null : json["status"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        givenAnswer: json["given_answer"] == null ? null : json["given_answer"],
        answers: json["answers"] == null
            ? null
            : List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "question": question == null ? null : question,
        "solution": solution == null ? null : solution,
        "type": type == null ? null : questionTypeValues.reverse[type],
        "marks": marks == null ? null : marks,
        "standard_id": standardId == null ? null : standardId,
        "subject_id": subjectId == null ? null : subjectId,
        "chapter_id": chapterId == null ? null : chapterId,
        "topic_id": topicId == null ? null : topicId,
        "video_id": videoId == null ? null : videoId,
        "status": status == null ? null : status,
        "created_on": createdOn == null ? null : createdOn.toIso8601String(),
        "given_answer": givenAnswer == null ? null : givenAnswer,
        "answers": answers == null
            ? null
            : List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.id,
    this.answer,
    this.isRight,
    this.questionId,
    this.createdOn,
  });

  int id;
  String answer;
  int isRight;
  int questionId;
  DateTime createdOn;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answer: json["answer"],
        isRight: json["is_right"],
        questionId: json["question_id"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "is_right": isRight,
        "question_id": questionId,
        "created_on": createdOn.toIso8601String(),
      };
}

enum QuestionType { MCQ }

final questionTypeValues = EnumValues({"MCQ": QuestionType.MCQ});

enum NoteType { PDF }

final noteTypeValues = EnumValues({"PDF": NoteType.PDF});

enum Icon { THE_20210211062219_PNG, EMPTY }

final iconValues = EnumValues(
    {"": Icon.EMPTY, "20210211062219.png": Icon.THE_20210211062219_PNG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/
