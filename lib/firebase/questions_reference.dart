import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_quiz/model/questions_model.dart';

import '../const/const.dart';
import '../model/category_model.dart';

Future<List<QuestionModel>> getQuestions(String categoryid) async {
  var list = List<QuestionModel>.empty(growable: true);

  // var source = await FirebaseDatabase.instance.ref().child(CATEGORY_REF).once();

  var source2 = await FirebaseFirestore.instance
      .collection(QUESTIONS_REF)
      .where(categoryid)
      .get()
      .then((QuerySnapshot snapshot) {
    for (var question in snapshot.docs) {
      list.add(QuestionModel(
          id: question["id"],
          answerA: question["answerA"],
          answerB: question["answerB"],
          answerC: question["answerC"],
          answerD: question["answerD"],
          categoryId: categoryid,
          correctAnswer: question["correctAnswer"],
          point: question["point"]));
    }
  });
  return list;
}
