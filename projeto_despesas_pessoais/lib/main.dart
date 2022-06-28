import 'package:flutter/material.dart';

import 'components/transaction_user.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text("Grafico"),
              ),
            ),
            TransactionUser()
          ],
        ),
      ),
    );
  }
}
