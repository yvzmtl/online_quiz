import '../../firebase/category_reference.dart';
import '../../model/category_model.dart';
import 'category_home_vm.dart';

class CategoryHomeViewModelImp implements CategoryHomeViewModel {
  @override
  Future<List<CategoryModel>> displayCategoryList() {
    return getCategories();
  }
}
