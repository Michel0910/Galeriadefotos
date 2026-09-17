import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/calculadora_page.dart';
import 'screens/cadastro_aluno_page.dart';
import 'screens/cursos_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galeria de Fotos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Tela inicial do app → Login
      initialRoute: '/login',
      routes: {
        '/login': (context) =>  LoginPage(),
        '/home': (context) => HomePage(),
        '/calculadora': (context) =>  CalculadoraPage(),
        '/cadastro': (context) =>  CadastroAlunoPage(),
        '/cursos': (context) =>  CursosPage(),
      },
    );
  }
}

