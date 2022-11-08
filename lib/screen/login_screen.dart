import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_quiz/screen/register_screen.dart';
import 'package:online_quiz/view_model/user_vm/user_view_model_imp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _passFocusNode = FocusNode();
  var _obscureText = true;
  final userViewModel = UserViewModelImp();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _userLogin() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formkey.currentState!.save();
      setState(() {});
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passwordTextController.text.toLowerCase().trim());
        Get.to(() => RegisterScreen());
        Get.snackbar(
          "Uyarı",
          "Giriş başrılı",
        );
      } on FirebaseException catch (e) {
        Get.snackbar("Uyarı", e.message.toString());
        print(e.message.toString());
        setState(() {});
      } catch (e) {
        Get.snackbar("Uyarı", e.toString());
        print(e.toString());
        setState(() {});
      } finally {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Login")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                //email text form
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      Get.snackbar(
                          "Uyarı", "Lütfen geçerli bir email adresi giriniz.");
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Password text form
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _passwordTextController,
                  focusNode: _passFocusNode,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  onEditingComplete: () {
                    _userLogin();
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      Get.snackbar("Uyarı", "Hatalı Şifre.");
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Şifremi Unuttum",
                      maxLines: 1,
                      style: GoogleFonts.jetBrainsMono(
                          color: Colors.lightBlue, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      /* userViewModel.userLogin(
                          _emailTextController.text.toLowerCase().trim(),
                          _passwordTextController.text.toLowerCase().trim()); */
                      _userLogin();
                    },
                    child: Text(
                      "Giriş Yap",
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Bir kullanıcınız yok mu?  ",
                        style: GoogleFonts.jetBrainsMono(
                            color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                              text: "Kayıt Ol",
                              style: GoogleFonts.jetBrainsMono(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => RegisterScreen());
                                }),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
