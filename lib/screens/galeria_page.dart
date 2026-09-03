import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_drawer.dart';

class GaleriaPage extends StatefulWidget{
  @override
  State<GaleriaPage> createState() => _GaleriaPageState();
}

class _GaleriaPageState extends State<GaleriaPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Galeria das melhores fotos"),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1nOe54vuw8ysRYvMxy1eEfSEBEgEJn6a-qFnWUWKXn9PMfd_tDegl-OY&s=10'),
              SizedBox(height: 20,),
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZjHkHjhIzEp9T2oEwxkvLAkoS369-P78rTJneVuBpMztEftH13aGz5IAf&s=10'),
              SizedBox(height: 20,),
              Image.asset('assets/images/bolsolulapraia.jpg'),
              SizedBox(height: 20,),
              Image.asset('assets/images/bolsolula.jpg')
            ],
          ),
        ),
      )
    );
  }

}