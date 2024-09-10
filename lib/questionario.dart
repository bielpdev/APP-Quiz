import 'package:app_quiz2024/questao.dart';
import 'package:app_quiz2024/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {super.key,
      required this.perguntaSeleciona,
      required this.responder,
      required this.perguntas});

  final int perguntaSeleciona;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  bool get temPerguntaSeleciona {
    const Text('data');
    return perguntaSeleciona < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSeleciona
        ? perguntas[perguntaSeleciona].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSeleciona]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(int.parse(resp['nota'].toString())),
          );
        }),
      ],
    );
  }
}
