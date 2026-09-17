import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';

class CadastroAlunoPage extends StatefulWidget {
  const CadastroAlunoPage({super.key});

  @override
  State<CadastroAlunoPage> createState() => _CadastroAlunoPageState();
}

class _CadastroAlunoPageState extends State<CadastroAlunoPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final cursoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Aluno")),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
                validator: (value) =>
                value == null || value.isEmpty ? "Digite o nome" : null,
              ),
              TextFormField(
                controller: idadeController,
                decoration: const InputDecoration(labelText: "Idade"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? "Digite a idade" : null,
              ),
              TextFormField(
                controller: cursoController,
                decoration: const InputDecoration(labelText: "Curso"),
                validator: (value) =>
                value == null || value.isEmpty ? "Digite o curso" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Aluno cadastrado com sucesso!")),
                    );
                  }
                },
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
