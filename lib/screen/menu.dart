import 'package:flutter/material.dart';
import 'package:online_quiz/strings/main_strings.dart';
import 'package:online_quiz/view_model/menu_vm/menu_view_model_imp.dart';
import 'package:online_quiz/widget/menu/menu_widget.dart';
import 'package:online_quiz/widget/menu/menu_widget_callback.dart';

class MenuScreen extends StatelessWidget {
  final viewModel = MenuViewModelImp();
  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(COLOR_MENU_BG),
      body: SafeArea(
        child: Column(
          children: [
            MenuWidget(
              icon: Icons.short_text_outlined,
              menuName: siralamaText,
              callback: viewModel.navigateSiralama,
            ),
            Divider(
              thickness: 1,
            ),
            MenuWidget(
              icon: Icons.question_answer,
              menuName: myQuestionsText,
              callback: viewModel.navigateMyQuestions,
            ),
            Divider(
              thickness: 1,
            ),
            MenuWidget(
              icon: Icons.shopping_cart_rounded,
              menuName: suggestionQuestionsText,
              callback: viewModel.navigateSuggestionQuestions,
            ),
            Divider(color: Colors.white),
            Spacer(
              flex: 2,
            ),
            MenuWidgetCallback(
              icon: viewModel.checkLoginState(context)
                  ? Icons.logout
                  : Icons.login,
              menuName:
                  viewModel.checkLoginState(context) ? logouttText : loginnText,
              callback: viewModel.checkLoginState(context)
                  ? viewModel.logout
                  : viewModel.login,
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
