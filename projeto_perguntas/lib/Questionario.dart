import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questao.dart';
import 'package:projeto_perguntas/Resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    Key? key,
    required this.indice,
    required this.perguntas,
    required this.callBack,
  }) : super(key: key);

  final int indice;
  final List<Map<String, Object>> perguntas;
  final void Function(int) callBack;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = perguntas[indice].cast()['respostas'];

    return Column(
      children: [
        Questao(perguntas[indice].cast()['texto']),
        ...respostas
            .map((resp) => Resposta(
                  resp['texto'] as String,
                  onPressed: () => callBack(resp['pontuacao'] as int),
                ))
            .toList()
      ],
    );
  }
}
