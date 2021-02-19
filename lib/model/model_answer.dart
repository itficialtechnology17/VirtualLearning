// To parse this JSON data, do
//
//     final modelAnswer = modelAnswerFromJson(jsonString);

import 'dart:convert';

List<ModelAnswer> modelAnswerFromJson(String str) => List<ModelAnswer>.from(
    json.decode(str).map((x) => ModelAnswer.fromJson(x)));

String modelAnswerToJson(List<ModelAnswer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAnswer {
  ModelAnswer({
    this.id,
    this.studentId,
    this.testId,
    this.questionId,
    this.answerId,
    this.marks,
    this.isRight,
    this.createdOn,
    this.question,
  });

  int id;
  int studentId;
  int testId;
  int questionId;
  int answerId;
  String marks;
  int isRight;
  DateTime createdOn;
  Question question;
  bool isSelected = false;

  factory ModelAnswer.fromJson(Map<String, dynamic> json) => ModelAnswer(
        id: json["id"],
        studentId: json["student_id"],
        testId: json["test_id"],
        questionId: json["question_id"],
        answerId: json["answer_id"],
        marks: json["marks"],
        isRight: json["is_right"],
        createdOn: DateTime.parse(json["created_on"]),
        question: Question.fromJson(json["question"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "test_id": testId,
        "question_id": questionId,
        "answer_id": answerId,
        "marks": marks,
        "is_right": isRight,
        "created_on": createdOn.toIso8601String(),
        "question": question.toJson(),
      };
}

class Question {
  Question({
    this.id,
    this.question,
    this.solution,
    this.type,
    this.marks,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.testId,
    this.status,
    this.createdOn,
    this.givenAnswer,
    this.answers,
  });

  int id;
  String question;
  String solution;
  Type type;
  String marks;
  int standardId;
  int subjectId;
  int chapterId;
  dynamic topicId;
  String testId;
  int status;
  DateTime createdOn;
  int givenAnswer;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        solution: json["solution"],
        type: typeValues.map[json["type"]],
        marks: json["marks"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        testId: json["test_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        givenAnswer: json["given_answer"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "solution": solution,
        "type": typeValues.reverse[type],
        "marks": marks,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "test_id": testId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "given_answer": givenAnswer,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
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
  bool isSelected = false;
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

enum Type { MCQ }

final typeValues = EnumValues({"MCQ": Type.MCQ});

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
