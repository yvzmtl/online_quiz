import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:online_quiz/state/category_state.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  final CategoryStateController categoryStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Online Quiz")),
      body: Container(
        child: Center(
          child: Text(
              "Seçilen kategori = ${categoryStateController.selectedCategory.value.name}"),
        ),
      ),
    );
  }
}
