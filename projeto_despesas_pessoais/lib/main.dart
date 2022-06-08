import 'package:flutter/material.dart';

void main() => runApp(const DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoas"),
      ),
      body: Center(
        child: const Text("Versão Inicial"),
      ),
    );
  }
}
