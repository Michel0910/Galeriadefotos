import 'package:flutter/material.dart';
import '../components/calculator_button.dart';
import '../components/menu_drawer.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _display = "";
  double? _primeiroNumero;
  String? _operador;

  void _onNumberPress(String numero) {
    setState(() => _display += numero);
  }

  void _onOperatorPress(String operador) {
    setState(() {
      _primeiroNumero = double.tryParse(_display);
      _operador = operador;
      _display = "";
    });
  }

  void _onEqualPress() {
    double? segundoNumero = double.tryParse(_display);
    if (_primeiroNumero != null && segundoNumero != null && _operador != null) {
      double resultado = 0;
      switch (_operador) {
        case '+':
          resultado = _primeiroNumero! + segundoNumero;
          break;
        case '-':
          resultado = _primeiroNumero! - segundoNumero;
          break;
        case '×':
          resultado = _primeiroNumero! * segundoNumero;
          break;
        case '÷':
          if (segundoNumero == 0) {
            setState(() {
              _display = "Erro: divisão por zero";
            });
            return;
          }
          resultado = _primeiroNumero! / segundoNumero;
          break;
      }
      setState(() {
        _display = resultado.toString();
        _primeiroNumero = null;
        _operador = null;
      });
    }
  }

  void _onClearPress() {
    setState(() {
      _display = "";
      _primeiroNumero = null;
      _operador = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                _display,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [
                CalculatorButton(texto: "7", onPressed: () => _onNumberPress("7")),
                CalculatorButton(texto: "8", onPressed: () => _onNumberPress("8")),
                CalculatorButton(texto: "9", onPressed: () => _onNumberPress("9")),
                CalculatorButton(texto: "÷", onPressed: () => _onOperatorPress("÷")),
              ]),
              Row(children: [
                CalculatorButton(texto: "4", onPressed: () => _onNumberPress("4")),
                CalculatorButton(texto: "5", onPressed: () => _onNumberPress("5")),
                CalculatorButton(texto: "6", onPressed: () => _onNumberPress("6")),
                CalculatorButton(texto: "×", onPressed: () => _onOperatorPress("×")),
              ]),
              Row(children: [
                CalculatorButton(texto: "1", onPressed: () => _onNumberPress("1")),
                CalculatorButton(texto: "2", onPressed: () => _onNumberPress("2")),
                CalculatorButton(texto: "3", onPressed: () => _onNumberPress("3")),
                CalculatorButton(texto: "-", onPressed: () => _onOperatorPress("-")),
              ]),
              Row(children: [
                CalculatorButton(texto: "0", onPressed: () => _onNumberPress("0")),
                CalculatorButton(texto: "C", onPressed: _onClearPress),
                CalculatorButton(texto: "=", onPressed: _onEqualPress),
                CalculatorButton(texto: "+", onPressed: () => _onOperatorPress("+")),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
