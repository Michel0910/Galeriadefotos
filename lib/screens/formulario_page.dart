import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/ElevateButtomComponente.dart';
import '../components/menu_drawer.dart';
import 'homepage.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPage();
}

class _FormularioPage extends State<FormularioPage> {
  // Chave do meu formulario deve ser unico
  final _formKey = GlobalKey<FormState>();

  //Controllers para os campos de input do formulario
  final TextEditingController _nomeConroller = TextEditingController();
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _idadeConroller = TextEditingController();
   String _jsonOutout = '';

  int? get green => null;
//finção convete para JSON
  void _gerarJson(){
    if(_formKey.currentState?.validate() ?? false) {
      final Map<String, dynamic> data = {
      'Nome': _nomeConroller.text,
      'email': _emailConroller.text,
      'idade': _idadeConroller.text
    };

    setState(() {
    _jsonOutout = jsonEncode(data);

    });
  }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Form"),
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          // formulario
          Form(
            key: _formKey,
            child: Column(
              children: [

                TextFormField(
                  controller: _nomeConroller,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Por favor, insira um nome';
                    }
                    return null;
                  }
                ),
                TextFormField(
                    controller: _emailConroller,
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    }
                ),

                TextFormField(
                    controller: _idadeConroller,
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    },
                ),
                SizedBox( height: 20,),

                Elevatebuttomcomponente(
                  label: 'Salvar',
                  onPressed: _gerarJson,
                  cor: Colors.green,

                ),
        ],

      ),

          ),

        ],
      ),
    );
  }
}