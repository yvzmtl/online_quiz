import 'package:flutter/material.dart';

class SiralamaScreen extends StatelessWidget {
  const SiralamaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siralama"),
      ),
      body: Container(
        child: Center(
          child: Text("Siralama"),
        ),
      ),
    );
  }
}
