import 'package:flutter/material.dart';
import 'package:galeria/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

      ),

      home: MyHomePage(title: 'Flutter Demo', modoEscuro: true,
        alterarTema: (bool value){},

      ),

    );

  }
}

