import 'package:app_quiz2024/main.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int nota;
  final void Function() reiniciarForm;
  Result(this.nota, this.reiniciarForm);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String get fraseResult {
    if (nota < 8) {
      return 'Você é bom!!';
    } else if (nota < 27) {
      return 'Jedai Mode';
    } else if (nota < 22) {
      return 'Quase lá!';
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
            style: TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: ElevatedButton(
              onPressed: widget.reiniciarForm,
              child: Text('Reiniciar Formulario')),
        )
      ],
    );
  }
}
