import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galeria/components/menu_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,
    required this.title,
    required this.modoEscuro,
    required this.alterarTema,

  });
  final String title;
  final bool modoEscuro;
  final ValueChanged<bool> alterarTema;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: MenuDrawer(),
      body: Center(),
    );
  }
}