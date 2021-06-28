// To parse this JSON data, do
//
//     final modelProgress = modelProgressFromJson(jsonString);

import 'dart:convert';

List<ModelProgress> modelProgressFromJson(String str) =>
    List<ModelProgress>.from(
        json.decode(str).map((x) => ModelProgress.fromJson(x)));

String modelProgressToJson(List<ModelProgress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProgress {
  ModelProgress({
    this.id,
    this.name,
    this.displayName,
    this.icon,
    this.status,
    this.color1,
    this.color2,
    this.createdOn,
    this.totalTopics,
    this.topicsLearned,
    this.totalMinutes,
    this.topicHistory,
    this.modelProgressColor1,
    this.modelProgressColor2,
    this.watchHistory,
  });

  int id;
  String name;
  String displayName;
  String icon;
  dynamic status;
  String color1;
  String color2;
  String createdOn;
  int totalTopics;
  int topicsLearned;
  int totalMinutes;
  List<TopicHistory> topicHistory;
  String modelProgressColor1;
  String modelProgressColor2;
  List<WatchHistory> watchHistory;

  factory ModelProgress.fromJson(Map<String, dynamic> json) => ModelProgress(
        id: json["id"],
        name: json["name"],
        displayName: json["display_name"],
        icon: json["icon"],
        status: json["status"],
        color1: json["color1"] == null ? null : json["color1"],
        color2: json["color2"] == null ? null : json["color2"],
        createdOn: json["created_on"],
        totalTopics: json["total_topics"],
        topicsLearned: json["topics_learned"],
        totalMinutes: json["total_minutes"],
        topicHistory: List<TopicHistory>.from(
            json["topic_history"].map((x) => TopicHistory.fromJson(x))),
        modelProgressColor1: json["color_1"] == null ? null : json["color_1"],
        modelProgressColor2: json["color_2"] == null ? null : json["color_2"],
        watchHistory: json["watchHistory"] == null
            ? null
            : List<WatchHistory>.from(
                json["watchHistory"].map((x) => WatchHistory.fromJson(x))),
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
        "total_topics": totalTopics,
        "topics_learned": topicsLearned,
        "total_minutes": totalMinutes,
        "topic_history":
            List<dynamic>.from(topicHistory.map((x) => x.toJson())),
        "color_1": modelProgressColor1 == null ? null : modelProgressColor1,
        "color_2": modelProgressColor2 == null ? null : modelProgressColor2,
        "watchHistory": watchHistory == null
            ? null
            : List<dynamic>.from(watchHistory.map((x) => x.toJson())),
      };
}

class WatchHistory {
  WatchHistory({
    this.id,
    this.userId,
    this.topicId,
    this.contentId,
    this.minutes,
    this.createdOn,
    this.file,
    this.videoId,
    this.video,
    this.title,
    this.type,
    this.standardId,
    this.subjectId,
    this.chapterId,
    this.vendorId,
    this.status,
    this.name,
    this.icon,
    this.ogTopicId,
    this.standardIcon,
    this.chapterName,
    this.color,
    this.image,
    this.question,
  });

  int id;
  int userId;
  int topicId;
  int contentId;
  dynamic minutes;
  DateTime createdOn;
  String file;
  String videoId;
  String video;
  String title;
  Type type;
  int standardId;
  int subjectId;
  String chapterId;
  dynamic vendorId;
  int status;
  String name;
  String icon;
  int ogTopicId;
  String standardIcon;
  String chapterName;
  String color;
  String image;
  List<Question> question;

  factory WatchHistory.fromJson(Map<String, dynamic> json) => WatchHistory(
        id: json["id"],
        userId: json["user_id"],
        topicId: json["topic_id"],
        contentId: json["content_id"],
        minutes: json["minutes"],
        createdOn: DateTime.parse(json["created_on"]),
        file: json["file"] == null ? null : json["file"],
        videoId: json["video_id"] == null ? null : json["video_id"],
        video: json["video"],
        title: json["title"],
        type: typeValues.map[json["type"]],
        standardId: json["standard_id"],
        subjectId: json["subject_id"],
        chapterId: json["chapter_id"],
        vendorId: json["vendor_id"],
        status: json["status"],
        name: json["name"],
        icon: json["icon"],
        ogTopicId: json["og_topic_id"],
        standardIcon: json["standard_icon"],
        chapterName: json["chapter_name"],
        color: json["color"] == null ? null : json["color"],
        image: json["image"] == null ? null : json["image"],
        question: json["question"] == null
            ? null
            : List<Question>.from(
                json["question"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "topic_id": topicId,
        "content_id": contentId,
        "minutes": minutes,
        "created_on": createdOn.toIso8601String(),
        "file": file == null ? null : file,
        "video_id": videoId == null ? null : videoId,
        "video": video,
        "title": title,
        "type": typeValues.reverse[type],
        "standard_id": standardId,
        "subject_id": subjectId,
        "chapter_id": chapterId,
        "vendor_id": vendorId,
        "status": status,
        "name": name,
        "icon": icon,
        "og_topic_id": ogTopicId,
        "standard_icon": standardIcon,
        "chapter_name": chapterName,
        "color": color == null ? null : color,
        "image": image == null ? null : image,
        "question": question == null
            ? null
            : List<dynamic>.from(question.map((x) => x.toJson())),
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
    this.videoId,
    this.status,
    this.createdOn,
    this.givenAnswer,
    this.answers,
  });

  int id;
  String question;
  dynamic solution;
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

  factory Question.fromJson(Map<String, dynamic> json) => Question(
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

enum Type { PDF }

final typeValues = EnumValues({"PDF": Type.PDF});

class TopicHistory {
  TopicHistory({
    this.createdOn,
    this.topicsLearned,
  });

  String createdOn;
  int topicsLearned;

  factory TopicHistory.fromJson(Map<String, dynamic> json) => TopicHistory(
        createdOn: json["created_on"],
        topicsLearned:
            json["topics_learned"] == null ? null : json["topics_learned"],
      );

  Map<String, dynamic> toJson() => {
        "created_on": createdOn,
        "topics_learned": topicsLearned == null ? null : topicsLearned,
      };
}

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
