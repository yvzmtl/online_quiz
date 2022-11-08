import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_quiz/const/const.dart';
import 'package:online_quiz/state/category_state.dart';
import 'package:online_quiz/strings/main_strings.dart';
import 'package:online_quiz/view_model/category_home_vm/category_home_vm_imp.dart';
import 'package:online_quiz/view_model/menu_vm/menu_view_model_imp.dart';
import 'package:online_quiz/widget/category/category_list_widget.dart';
import 'package:online_quiz/widget/menu/menu_widget.dart';
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
  final categoryviewModel = CategoryHomeViewModelImp();
  final viewModel = MenuViewModelImp();
  MyHomePage();

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final CategoryStateController categoryStateController =
      Get.put(CategoryStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appNameText,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      //drawer: MenuScreen(),
      drawer: Drawer(
        backgroundColor: Color(COLOR_OVERLAY),
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(COLOR_ICON_DRAWER)),
              // ignore: prefer_const_constructors
              accountName: Text(
                "yavuz",
                style: GoogleFonts.jetBrainsMono(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              accountEmail: Text(
                "yavuz@gmail.com",
                style: GoogleFonts.jetBrainsMono(
                    fontStyle: FontStyle.italic, fontSize: 16),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            //MenuScreen()
            Divider(
              thickness: 2,
            ),
            MenuWidget(
                menuName: siralamaText,
                callback: widget.viewModel.navigateSiralama,
                icon: Icons.short_text_rounded),
            Divider(
              thickness: 2,
            ),
            MenuWidget(
                menuName: myQuestionsText,
                callback: widget.viewModel.navigateMyQuestions,
                icon: Icons.question_answer),
            Divider(
              thickness: 2,
            ),
            MenuWidget(
                menuName: suggestionQuestionsText,
                callback: widget.viewModel.navigateSuggestionQuestions,
                icon: Icons.question_mark),
            Divider(
              thickness: 2,
            ),

            Divider(color: Colors.white),
            Spacer(
              flex: 2,
            ),
            MenuWidget(
                menuName: loginnText,
                callback: widget.viewModel.navigateLogin,
                icon: Icons.login),
            /* MenuWidgetCallback(
              icon: widget.viewModel.checkLoginState(context)
                  ? Icons.logout
                  : Icons.login,
              menuName: widget.viewModel.checkLoginState(context)
                  ? logouttText
                  : loginnText,
              callback: widget.viewModel.checkLoginState(context)
                  ? widget.viewModel.logout
                  : widget.viewModel.login,
            ), */
          ],
        ),
      ),
      body: FutureBuilder(
        future: widget.categoryviewModel.displayCategoryList(),
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
