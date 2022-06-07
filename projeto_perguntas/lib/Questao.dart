import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String title;

  const Questao(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(28),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ));
  }
}
