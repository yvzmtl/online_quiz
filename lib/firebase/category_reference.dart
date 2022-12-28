import 'package:cloud_firestore/cloud_firestore.dart';
import '../const/const.dart';
import '../model/category_model.dart';

Future<List<CategoryModel>> getCategories() async {
  var list = List<CategoryModel>.empty(growable: true);

  // var source = await FirebaseDatabase.instance.ref().child(CATEGORY_REF).once();

  var source2 = await FirebaseFirestore.instance
      .collection(CATEGORY_REF)
      .get()
      .then((QuerySnapshot snapshot) {
    for (var category in snapshot.docs) {
      list.add(CategoryModel(
          id: category["id"],
          name: category["name"],
          image: category["image"]));
    }
  });

  // var values = source.snapshot;
  // values.children.forEach((element) {
  //   list.add(CategoryModel.fromJson(jsonDecode(jsonEncode(element.value))));
  // });
  return list;
}
