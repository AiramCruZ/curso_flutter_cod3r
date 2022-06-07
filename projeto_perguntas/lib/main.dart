import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questionario.dart';
import 'package:projeto_perguntas/Resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 2},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 8},
        {'texto': 'Leão', 'pontuacao': 9},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 2},
        {'texto': 'João', 'pontuacao': 8},
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 4},
      ]
    }
  ];
  bool get possuiPergunta => _perguntaSelecionada < _perguntas.length;

  void _responder(int pontuacao) {
    if (possuiPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: possuiPergunta
            ? Questionario(
                indice: _perguntaSelecionada,
                perguntas: _perguntas,
                callBack: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
