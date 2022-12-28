import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_quiz/model/questions_model.dart';
import 'package:online_quiz/state/category_state.dart';
import 'package:online_quiz/state/questions_state.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  final CategoryStateController categoryStateController = Get.find();
  final QuestionsStateController questionsStateController =
      Get.put(QuestionsStateController());
  //final List<QuestionModel> lst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Online Quiz")),
      body: Container(
        child: Center(
          child: Text(
              "Seçilen kategori = ${categoryStateController.selectedCategory.value.id}"),
        ),
      ),
    );
  }
}
