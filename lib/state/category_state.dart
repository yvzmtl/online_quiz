import 'package:get/get.dart';
import 'package:online_quiz/model/category_model.dart';
import 'package:online_quiz/model/questions_model.dart';

class CategoryStateController extends GetxController {
  var selectedCategory =
      CategoryModel(id: "id", name: "name", image: "image").obs;

  clearQuestionList(List<QuestionModel> listquestions) {
    listquestions.clear();
  }
}
