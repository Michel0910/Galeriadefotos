import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galeria/screens/galeria_page.dart';

import '../main.dart';
import '../screens/formulario_page.dart';
import '../screens/homepage.dart';

class MenuDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: "Galeria das boas"),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Cuidado..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GaleriaPage()),
              );
            },
          ),
          ListTile(
            title: Text("Formulario"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormularioPage()),
              );
            },
          )
        ],
      ),
    );
  }

}