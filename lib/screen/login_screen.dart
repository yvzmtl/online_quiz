import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-mail",
                        hintText: "E-mail"),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-mail",
                        hintText: "E-mail"),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Giriş ")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
