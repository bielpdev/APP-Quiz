import 'package:app_quiz2024/main.dart';
import 'package:app_quiz2024/questionario.dart';
import 'package:app_quiz2024/resultado.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var perguntaSelecionada = 0;
  int notatotal = 0;
  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'Preto', 'nota': 1},
        {'texto': 'Vermelho', 'nota': 2},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 2},
        {'texto': 'Cobra', 'nota': 7},
        {'texto': 'Elefante', 'nota': 2},
        {'texto': 'Leao', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Joao', 'nota': 3},
        {'texto': 'Maria', 'nota': 4},
        {'texto': 'Leo', 'nota': 2},
        {'texto': 'Pedro', 'nota': 5},
      ],
    },
  ];

  void responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        notatotal += nota;
      });
    }
    print(nota);
  }

  void reiniciarForm() {
    setState(() {
      perguntaSelecionada = 0;
      nota = 0;
    });
  }

  get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(style: TextStyle(color: Colors.white), 'Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSeleciona: perguntaSelecionada,
                responder: responder,
                perguntas: perguntas)
            : Result(notatotal, reiniciarForm));
  }
}
