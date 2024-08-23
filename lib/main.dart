import 'package:app_quiz2024/home_page.dart';
import 'package:flutter/material.dart';

int nota = 0;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    ),
  );
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage(
      nota: nota,
    );
  }
}
