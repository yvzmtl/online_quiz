import '../../model/category_model.dart';

abstract class CategoryHomeViewModel{
  Future<List<CategoryModel>> displayCategoryList();
}