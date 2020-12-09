import 'dart:convert';

List<ModelQuestion> modelQuestionFromJson(String str) =>
    List<ModelQuestion>.from(
        json.decode(str).map((x) => ModelQuestion.fromJson(x)));

String modelQuestionToJson(List<ModelQuestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelQuestion {
  ModelQuestion({
    this.id,
    this.question,
    this.type,
    this.marks,
    this.testId,
    this.status,
    this.createdOn,
    this.givenAnswer,
    this.answers,
  });

  int id;
  String question;
  String type;
  String marks;
  int testId;
  int status;
  int isSelected = 0;
  int givenAns = 0;
  DateTime createdOn;
  int givenAnswer;
  List<Answer> answers;

  factory ModelQuestion.fromJson(Map<String, dynamic> json) => ModelQuestion(
        id: json["id"],
        question: json["question"],
        type: json["type"],
        marks: json["marks"],
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
        "type": type,
        "marks": marks,
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
