import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String title;

  const Resposta(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blue, 
          onPrimary: Colors.white
      ),
      onPressed: null,
      child: Text(title),
    );
  }
}
