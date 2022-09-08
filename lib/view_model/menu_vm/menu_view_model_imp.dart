import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:get/get.dart';
import 'package:online_quiz/main.dart';
import 'package:online_quiz/screen/myquestions_screen.dart';
import 'package:online_quiz/screen/siralama_screen.dart';
import 'package:online_quiz/screen/suggestion_questions.dart';
import 'package:online_quiz/strings/main_strings.dart';
import 'package:online_quiz/view_model/menu_vm/menu_view_model.dart';

class MenuViewModelImp implements MenuViewModel {
  @override
  bool checkLoginState(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null ? true : false;
  }

  @override
  void login(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      FlutterAuthUi.startUi(
              items: [AuthUiProvider.email],
              tosAndPrivacyPolicy: TosAndPrivacyPolicy(
                  tosUrl: "https://google.com",
                  privacyPolicyUrl: "https://youtube.com"),
              androidOption: AndroidOption(
                  enableSmartLock: false, showLogo: true, overrideTheme: true))
          .then((value) async {
        Get.to(() => MyApp());
      }).catchError((e) {
        Get.snackbar("Hata", "$e");
      });
    }
  }

  @override
  void logout(BuildContext context) {
    Get.defaultDialog(
      title: logoutTitle,
      content: Text(logoutText),
      backgroundColor: Colors.white,
      cancel:
          ElevatedButton(onPressed: () => Get.back(), child: Text(cancelText)),
      confirm: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) => Get.offAll(MyApp()));
        },
        child: Text(confirmText, style: TextStyle(color: Colors.red)),
      ),
    );
  }

  @override
  void navigateMyQuestions() {
    Get.to(() => MyQuestionsScreen());
  }

  @override
  void navigateSiralama() {
    Get.to(() => SiralamaScreen());
  }

  @override
  void navigateHomeScreen() {
    Get.to(() => MyApp());
  }

  @override
  void navigateSuggestionQuestions() {
    Get.to(() => SuggestionQuestionsScreen());
  }
}
