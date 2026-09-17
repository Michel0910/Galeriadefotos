import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/galeria_page.dart';
import '../screens/formulario_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text("Galeria"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GaleriaPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Formulário"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormularioPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
