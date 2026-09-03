import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Elevatebuttomcomponente extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;
  final Color cor;

  //Construtor
  Elevatebuttomcomponente( {
    required this.label,
    required this.onPressed,
    required this.cor,

  }  );

  @override
  Widget build(BuildContext context) {
    return
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
      ),
        onPressed: onPressed,
        child: Text(label));
    throw UnimplementedError();
  }


}