// To parse this JSON data, do
//
//     final modelBookmark = modelBookmarkFromJson(jsonString);

import 'dart:convert';

List<ModelBookmark> modelBookmarkFromJson(String str) =>
    List<ModelBookmark>.from(
        json.decode(str).map((x) => ModelBookmark.fromJson(x)));

String modelBookmarkToJson(List<ModelBookmark> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBookmark {
  ModelBookmark({
    this.id,
    this.subjectId,
    this.standardId,
    this.description,
    this.createdOn,
    this.name,
    this.displayName,
    this.icon,
    this.status,
    this.color1,
    this.color2,
    this.favourites,
    this.topicQuestion,
    this.chapterQuestion,
  });

  int id;
  String subjectId;
  String standardId;
  dynamic description;
  DateTime createdOn;
  String name;
  String displayName;
  String icon;
  int status;
  String color1;
  String color2;
  List<Favourite> favourites;
  List<TopicQuestion> topicQuestion;
  List<TopicQuestion> chapterQuestion;

  factory ModelBookmark.fromJson(Map<String, dynamic> json) => ModelBookmark(
        id: json["id"],
        subjectId: json["subject_id"],
        standardId: json["standard_id"],
        description: json["description"],
        createdOn: DateTime.parse(json["created_on"]),
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
        color1: json["color_1"],
        color2: json["color_2"],
        favourites: List<Favourite>.from(
            json["favourites"].map((x) => Favourite.fromJson(x))),
        topicQuestion: List<TopicQuestion>.from(
            json["topic_questions"].map((x) => TopicQuestion.fromJson(x))),
        chapterQuestion: List<TopicQuestion>.from(
            json["chapter_questions"].map((x) => TopicQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "standard_id": standardId,
        "description": description,
        "created_on": createdOn.toIso8601String(),
        "name": name,
        "display_name": displayName,
        "icon": icon,
        "status": status,
        "color_1": color1,
        "color_2": color2,
        "favourites": List<dynamic>.from(favourites.map((x) => x.toJson())),
        "topic_questions":
            List<dynamic>.from(topicQuestion.map((x) => x.toJson())),
        "chapter_questions":
            List<dynamic>.from(chapterQuestion.map((x) => x.toJson())),
      };
}

class Favourite {
  Favourite({
    this.id,
    this.name,
    this.minutes,
    this.icon,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.status,
    this.createdOn,
    this.content,
    this.isFavorite,
    this.color,
    this.image,
  });

  int id;
  String name;
  dynamic minutes;
  String icon;
  int standardId;
  int subjectId;
  String chapterId;
  int status;
  DateTime createdOn;
  Content content;
  int isFavorite;
  String color;
  String image;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"],
        name: json["name"],
        minutes: json["minutes"],
        icon: json["icon"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        content: Content.fromJson(json["content"]),
        isFavorite: json["is_favorite"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minutes": minutes,
        "icon": icon,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "content": content.toJson(),
        "is_favorite": isFavorite,
        "color": color,
        "image": image,
      };
}

class Content {
  Content({
    this.id,
    this.file,
    this.videoId,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.topicId,
    this.vendorId,
    this.status,
    this.createdOn,
    this.video,
  });

  int id;
  String file;
  String videoId;
  String video;
  String title;
  String type;
  int standardId;
  int subjectId;
  int chapterId;
  int topicId;
  dynamic vendorId;
  int status;
  DateTime createdOn;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        file: json["file"],
        videoId: json["video_id"],
        title: json["title"],
        type: json["type"],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        topicId: json["topic_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "video_id": videoId,
        "title": title,
        "type": type,
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "topic_id": topicId,
        "vendor_id": vendorId,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "video": video,
      };
}

List<TopicQuestion> topicQuestionFromJson(String str) =>
    List<TopicQuestion>.from(
        json.decode(str).map((x) => TopicQuestion.fromJson(x)));

String topicQuestionToJson(List<TopicQuestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopicQuestion {
  TopicQuestion({
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
    this.isFavorite,
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
  List<Answer> answers;
  int isFavorite;

  factory TopicQuestion.fromJson(Map<String, dynamic> json) => TopicQuestion(
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
        isFavorite: json["is_favorite"],
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
        "is_favorite": isFavorite,
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
