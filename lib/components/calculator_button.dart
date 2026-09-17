import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color? cor;

  const CalculatorButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor ?? Colors.black, // fundo preto
            foregroundColor: Colors.white,        // texto branco
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(
              fontSize: 24,                       // números maiores
              fontWeight: FontWeight.bold,        // mais visíveis
            ),
          ),
          onPressed: onPressed,
          child: Text(texto),
        ),
      ),
    );
  }
}
