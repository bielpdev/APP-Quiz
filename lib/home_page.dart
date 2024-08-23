import 'package:app_quiz2024/main.dart';
import 'package:app_quiz2024/questionario.dart';
import 'package:app_quiz2024/resultado.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.nota});
  int nota;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'Preto', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 6},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 7},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 7},
        {'texto': 'Cobra', 'nota': 9},
        {'texto': 'Elefante', 'nota': 5},
        {'texto': 'Leao', 'nota': 12},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Joao', 'nota': 12},
        {'texto': 'Maria', 'nota': 11},
        {'texto': 'Leo', 'nota': 8},
        {'texto': 'Pedro', 'nota': 17},
      ],
    },
  ];

  void responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        nota += nota;
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
          title: Center(
            child: Text(style: TextStyle(color: Colors.white), 'Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSeleciona: perguntaSelecionada,
                responder: responder,
                perguntas: perguntas)
            : Result(nota, reiniciarForm));
  }
}
