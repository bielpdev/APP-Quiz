import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int notatotal;

  final void Function() reiniciarForm;
  Result(this.notatotal, this.reiniciarForm, {super.key});

  String get fraseResult {
    if (notatotal < 8) {
      return 'Você é bom!!';
    } else if (notatotal < 15) {
      return 'Jedai Mode';
    } else if (notatotal < 20) {
      return 'VC é o melhor!';
    } else {
      return 'MAGNIFICOO';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResult,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: ElevatedButton(
              onPressed: reiniciarForm,
              child: const Text('Reiniciar Formulario')),
        )
      ],
    );
  }
}
