import 'package:flutter/material.dart';

class SuggestionQuestionsScreen extends StatelessWidget {
  const SuggestionQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soru Öner"),
      ),
      body: Container(
        child: Center(
          child: Text("Soru Öner"),
        ),
      ),
    );
  }
}
