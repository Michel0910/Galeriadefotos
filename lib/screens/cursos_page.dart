import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';

class CursosPage extends StatelessWidget {
  const CursosPage({super.key});

  final List<Map<String, String>> cursos = const [
    {"nome": "Técnico de Informática", "imagem": "assets/images/informatica.png"},
    {"nome": "Gestão de Pessoas", "imagem": "assets/images/gestao_pessoas.png"},
    {"nome": "Desenvolvimento de Sistemas", "imagem": "assets/images/sistemas.png"},
    {"nome": "Gestão de Processos", "imagem": "assets/images/processos.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cursos")),
      drawer: const MenuDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // duas colunas
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          final curso = cursos[index];
          return Tooltip(
            message: curso["nome"]!, // mensagem ao passar o mouse
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      curso["imagem"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    curso["nome"]!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
