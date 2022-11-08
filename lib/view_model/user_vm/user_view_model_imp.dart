import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_quiz/view_model/user_vm/user_view_model.dart';

class UserViewModelImp extends UserViewModel {
  @override
  Future<void> userLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not_found') {
        Get.snackbar("Uyarı", "Bu email için kullanıcı bulunamadı");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Uyarı", "Hatalı şifre");
      } else {
        Get.snackbar("Uyarı", e.code);
      }
    }
  }

  @override
  void userLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}
