import 'package:firebase_auth/firebase_auth.dart';

abstract class UserViewModel {
  void userLogin(String email, String password);
  void userLogout();
  Future<User> signUp(String username, String email, String password);
}
