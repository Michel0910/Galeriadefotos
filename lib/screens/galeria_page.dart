import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_drawer.dart';

class GaleriaPage extends StatefulWidget {

  @override
  State<GaleriaPage> createState() => _GaleriaPageState();

}

class _GaleriaPageState extends State<GaleriaPage> {

  final List<Map<String, String>> _lugares = [
    {
      'nome': 'Los caracles',
      'local': 'Andes, Chile',
      'imagem': 'assets/images/Cordilheira.jpg',
      'descrição':
          'Uma estrada inca cordilheira dos anedes com curvas e morros',
    },
    {
      'nome': 'aurora boreal',
      'local': 'Alasca, Estados Unidos',
      'imagem': 'assets/images/Aurora Boreal.jpg',
      'descrição': 'Fairbanks, que fica bem embaixo do oval auroral',
    },
    {
      'nome': 'machu picchu',
      'local': 'Urubamba, Peru',
      'imagem': 'assets/images/Machupitcho.jpg',
      'descrição':
          'Localizada no topo de uma montanha no distrito de Machupicchu, na província de Urubamba, no Peru',
    },
    {
      'nome': 'Patagônia',
      'local': 'Chile',
      'imagem': 'assets/images/Patagonia.jpg',
      'descrição':
          'A Patagônia Chilena é uma vasta região no extremo sul do continente americano, famosa por seus glaciares, montanhas imponentes, fiordes e parques nacionais',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Galeria das melhores fotos"),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: _lugares.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),

          itemBuilder: (context, index) {
            final lugar = _lugares[index];
            return _buildCardDestino(lugar);
          },
        ),
      ),
    );
  }

  Widget _buildCardDestino(Map<String, String> lugar) {
    final String nome = lugar['nome'] ?? '';
    final String local = lugar['local'] ?? '';
    final String imagem = lugar['imagem'] ?? '';

    //Inkwell deixa um componente filho clicavel
    // desenhando um efeito no memo.
    return InkWell(
      onTap: () => _abrirDetalhesDolugar(lugar),
      child: Card(
        elevation: 3,
        //Aqui usamos Stack porque queremos colocar o nomeado
        //lugar na frente daa imagem e não embaixo dela
        child: Stack(
          fit: StackFit.expand,
          children: [
            //ClipRRect recorta um componente flho para que imagem
            // fique com os cantos arredondados
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagem, fit: BoxFit.cover),
            ),

            // posição onde dentro do Sateck este elemento vai ficar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),

                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),

                child: Column(
                  children: [
                    Text(nome, style: TextStyle(color: Colors.white)),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.amber, size: 14),
                        SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            local,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _abrirDetalhesDolugar(Map<String, String> lugar) {
    //Abre bottomsheet (modal) com mais detalhes do destino escondido.
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //foto grande do lugar
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.asset(lugar['imagem'] ?? '',
                      fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 16),
              Text(lugar['nome'] ?? ''),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  SizedBox(width: 6),
                  Text(lugar['local'] ?? ''),
                ],
              ),
              SizedBox(height: 16),
              Text(lugar['descrição'] ?? ''),
            ],
          ),
        );
      },
    );
  }
}
