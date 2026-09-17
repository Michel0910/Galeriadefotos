import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      drawer:  MenuDrawer(), // menu lateral
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo ao aplicativo!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/calculadora');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Calculadora"),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cursos');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Cursos"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
