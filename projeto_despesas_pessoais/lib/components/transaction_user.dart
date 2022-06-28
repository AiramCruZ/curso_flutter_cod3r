import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../model/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _transactions = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(
          onSubmit: _addTransactions,
        ),
        TransactionsList(transactions: _transactions),
      ],
    );
  }
}
