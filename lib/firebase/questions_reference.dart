import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_quiz/model/questions_model.dart';

import '../const/const.dart';

Future<List<QuestionModel>> getQuestions(String categoryid) async {
  var list = List<QuestionModel>.empty(growable: true);

  // var source = await FirebaseDatabase.instance.ref().child(CATEGORY_REF).once();

  // var source = await FirebaseFirestore.instance
  //     .collection(QUESTIONS_REF)
  //     .where(categoryid)
  //     .get()
  //     .then((QuerySnapshot snapshot) {

  //   for (var questions in snapshot.docs) {
  //     list.add(QuestionModel(
  //         id: questions["id"],
  //         answerA: questions["answerA"],
  //         answerB: questions["answerB"],
  //         answerC: questions["answerC"],
  //         answerD: questions["answerD"],
  //         categoryId: categoryid,
  //         correctAnswer: questions["correctAnswer"],
  //         point: questions["point"],
  //         question: questions["question"]));
  //   }
  // });

  var source = await FirebaseFirestore.instance
      .collection(QUESTIONS_REF)
      .where(categoryid)
      .get();

  var values = source.docs;
  for (var element in values) {
    list.add(QuestionModel.fromJson(jsonDecode(jsonEncode(element.data()))));
  }
  return list;
}
