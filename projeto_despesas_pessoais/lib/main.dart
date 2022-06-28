import 'dart:math';

import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'model/transaction.dart';

void main() => runApp(const DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #02',
    //   value: 200,
    //   date: DateTime.now().subtract(const Duration(days: 2)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #03',
    //   value: 300,
    //   date: DateTime.now().subtract(const Duration(days: 3)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #04',
    //   value: 400,
    //   date: DateTime.now().subtract(const Duration(days: 4)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #05',
    //   value: 500,
    //   date: DateTime.now().subtract(const Duration(days: 5)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #06',
    //   value: 600,
    //   date: DateTime.now().subtract(const Duration(days: 6)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #07',
    //   value: 700,
    //   date: DateTime.now().subtract(const Duration(days: 7)),
    // ),
    // Transaction(
    //   id: Random().nextDouble().toString(),
    //   title: 'Conta #08',
    //   value: 800,
    //   date: DateTime.now().subtract(const Duration(days: 8)),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  _addTransactions(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransactions);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoas"),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Chart(
                recentTransactions: _recentTransactions,
              ),
            ),
            TransactionsList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
