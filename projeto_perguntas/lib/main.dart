import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  void responder() {
    debugPrint('Resposta 1 selecionada.');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(0)),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Resposta 2 selecionada.');
              },
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: () => debugPrint('Resposta 3 selecionada.'),
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
