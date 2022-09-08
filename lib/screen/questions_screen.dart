import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_quiz/state/category_state.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  final CategoryStateController categoryStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Online Quizzzzzz")),
      body: Container(
        child: Center(
          child: Text(
              "Seçilen kategori = ${categoryStateController.selectedCategory.value.name}"),
        ),
      ),
    );
  }
}
