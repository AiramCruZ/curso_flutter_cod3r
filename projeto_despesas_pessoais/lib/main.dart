import 'package:flutter/material.dart';
import 'package:projeto_despesas_pessoais/components/transaction_form.dart';
import 'package:projeto_despesas_pessoais/components/transaction_list.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

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
    final List<Transaction> _transactions = [
      Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Conta de Luz',
        value: 211.30,
        date: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoas"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Grafico"),
            ),
          ),
          TransactionsList(transactions: _transactions),
          const TransactionForm(),
        ],
      ),
    );
  }
}
