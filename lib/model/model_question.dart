class ModelQuestion {
  ModelQuestion({
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
  String type;
  String marks;
  int standardId;
  int subjectId;
  int chapterId;
  int topicId;
  String videoId;
  int status;
  DateTime createdOn;
  int givenAnswer;
  bool isSelected = false;

  List<Answer> answers;

  factory ModelQuestion.fromJson(Map<String, dynamic> json) => ModelQuestion(
        id: json["id"],
        question: json["question"],
        solution: json["solution"],
        type: json["type"],
        marks: json["marks"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        videoId: json["video_id"],
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
        "type": type,
        "marks": marks,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "video_id": videoId,
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
  bool isSelected = false;

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
