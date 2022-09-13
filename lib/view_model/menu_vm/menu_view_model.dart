import 'package:flutter/cupertino.dart';

abstract class MenuViewModel {
  void navigateMyQuestions();
  void navigateSiralama();
  void navigateHomeScreen();
  void navigateSuggestionQuestions();
  void navigateLogin();
  void navigateRegister();
  bool checkLoginState(BuildContext context);
  void login(BuildContext context);
  void logout(BuildContext context);
}
