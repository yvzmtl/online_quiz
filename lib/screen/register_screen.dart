import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_quiz/screen/login_screen.dart';
import 'package:online_quiz/view_model/user_vm/user_view_model_imp.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _repeatpasswordcontroller =
      TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final userViewModelImp = UserViewModelImp();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: size.height * 0.7,
              width: size.width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.75),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.75),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "KAYIT",
                      style: GoogleFonts.jetBrainsMono(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    TextField(
                      controller: _usernamecontroller,
                      style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        hintText: "Kullanıcı Adı",
                        prefixText: '',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    // E- mail
                    TextField(
                      controller: _emailcontroller,
                      style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        hintText: "E-mail",
                        prefixText: '',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextField(
                      controller: _passwordcontroller,
                      style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        hintText: "Şifre",
                        prefixText: '',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextField(
                      controller: _repeatpasswordcontroller,
                      style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        hintText: "Şifre Tekrar",
                        prefixText: '',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.08),
                    InkWell(
                      onTap: () {
                        userViewModelImp
                            .signUp(_usernamecontroller.text,
                                _emailcontroller.text, _passwordcontroller.text)
                            .then((value) {
                          Get.to(() => LoginScreen());
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "Kayıt Ol",
                              style: GoogleFonts.jetBrainsMono(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
