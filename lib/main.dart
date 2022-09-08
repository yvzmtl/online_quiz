import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_quiz/state/category_state.dart';
import 'package:online_quiz/view_model/category_home_vm/category_home_vm_imp.dart';
import 'package:online_quiz/widget/category/category_list_widget.dart';

import 'model/category_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final viewModel = CategoryHomeViewModelImp();

  MyHomePage();

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final viewModel = CategoryHomeViewModelImp();
  final CategoryStateController categoryStateController =
      Get.put(CategoryStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Online Quiz",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: FutureBuilder(
        future: widget.viewModel.displayCategoryList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var lst = snapshot.data as List<CategoryModel>;

            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: CategoryListWidget(
                  lst: lst, categoryStateController: categoryStateController),
            );
          }
        },
      ),
    );
  }
}
