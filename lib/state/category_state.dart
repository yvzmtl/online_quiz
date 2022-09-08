import 'package:get/get.dart';
import 'package:online_quiz/model/category_model.dart';

class CategoryStateController extends GetxController {
  var selectedCategory = CategoryModel(name: "name", image: "image").obs;
}
