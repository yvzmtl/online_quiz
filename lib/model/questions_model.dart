import 'dart:convert';

// QuestionsModel questionsModelFromJson(String str) =>
//     QuestionsModel.fromJson(json.decode(str));

// String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

// class QuestionsModel {
//   QuestionsModel({
//     required this.questions,
//   });

//   List<QuestionModel> questions;

//   factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
//         questions: List<QuestionModel>.from(
//             json["Questions"].map((x) => QuestionModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Questions": List<dynamic>.from(questions.map((x) => x.toJson())),
//       };
// }

class QuestionModel {
  QuestionModel({
    required this.id,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.categoryid,
    required this.correctAnswer,
    required this.point,
    required this.question,
  });

  String id;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String categoryid;
  String correctAnswer;
  String point;
  String question;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        answerA: json["answerA"],
        answerB: json["answerB"],
        answerC: json["answerC"],
        answerD: json["answerD"],
        categoryid: json["categoryid"],
        correctAnswer: json["correctAnswer"],
        point: json["point"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answerA": answerA,
        "answerB": answerB,
        "answerC": answerC,
        "answerD": answerD,
        "categoryId": categoryid,
        "correctAnswer": correctAnswer,
        "point": point,
        "question": question,
      };
}
