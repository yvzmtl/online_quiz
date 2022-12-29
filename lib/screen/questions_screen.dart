import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_quiz/model/questions_model.dart';
import 'package:online_quiz/state/category_state.dart';
import 'package:online_quiz/state/questions_state.dart';
import 'package:online_quiz/view_model/questions_vm/questions_view_model_imp.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  final CategoryStateController categoryStateController = Get.find();
  final QuestionsStateController questionsStateController =
      Get.put(QuestionsStateController());
  //final List<QuestionModel> lst;

  @override
  Widget build(BuildContext context) {
    final questionviewModel = QuestionViewModelImp();
    return Scaffold(
      appBar: AppBar(title: Text("Online Quiz")),

      body: FutureBuilder(
        future: questionviewModel.displayQuestionsList(
            categoryStateController.selectedCategory.value.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var lst = snapshot.data as List<QuestionModel>;
            lst.shuffle();

            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Center(
                  child: Column(
                children: [
                  Text("Soru id : ${lst.first.id}"),
                  Text("Soru : ${lst.first.question}"),
                  Text(" A : ${lst.first.answerA}"),
                  Text("B : ${lst.first.answerB}"),
                  Text("C : ${lst.first.answerC}"),
                  Text(" D : ${lst.first.answerD}"),
                  Text("Doğru Cevap : ${lst.first.correctAnswer}"),
                  Text(" Puan ${lst.first.point}"),
                  Text(
                      "Category id : ${categoryStateController.selectedCategory.value.id}"),
                ],
              )),
              // child: Column(Text("${lst[]}")),
              //child: CategoryListWidget(lst: lst, categoryStateController: categoryStateController),
            );
          }
        },
      ),
      // Container(
      //   child: Center(
      //     child: Text(
      //         "Seçilen kategori = ${categoryStateController.selectedCategory.value.id}"),
      //   ),
      // ),
    );
  }
}
