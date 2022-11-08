import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_quiz/view_model/user_vm/user_view_model.dart';

class UserViewModelImp extends UserViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> userLogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not_found') {
        Get.snackbar("Uyarı", "Bu email için kullanıcı bulunamadı");
      } else if (e.code ==
          'The password is invalid or the user does not have a password.') {
        Get.snackbar("Uyarı", "Kullanıcı Adı veye Şifre Hatalı");
      } else {
        Get.snackbar("Uyarı", e.code);
      }
    }
  }

  @override
  void userLogout() async {
    await _auth.signOut();
  }

  @override
  Future<User> signUp(String username, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("User")
        .doc(user.user!.uid)
        .set({'username': username, 'email': email});

    return user.user!;
  }
}
