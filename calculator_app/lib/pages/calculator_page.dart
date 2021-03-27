import 'dart:developer';

import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
        actions: <Widget>[
          new IconButton(
            iconSize: 30,
            icon: new Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'Calculator kleber  https://medium.com/flutter-comunidade-br/desenvolvimento-de-uma-calculadora-simples-com-flutter-56106baae51',
                  subject: 'Where I learned!');
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _showHistory(histOperations: _controller.histOperations),
          _buildDisplay(result: _controller.result),
          // _buildHistoric(label: _operation.label),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 500,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.green.shade200),
                _buildButton(label: 'DEL', color: Colors.green.shade200),
                _buildButton(label: '%', color: Colors.green.shade200),
                _buildButton(label: '/', color: Colors.green.shade200),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '7'),
                _buildButton(label: '8'),
                _buildButton(label: '9'),
                _buildButton(label: 'x', color: Colors.green.shade200),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '4'),
                _buildButton(label: '5'),
                _buildButton(label: '6'),
                _buildButton(label: '+', color: Colors.green.shade200),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '1'),
                _buildButton(label: '2'),
                _buildButton(label: '3'),
                _buildButton(label: '-', color: Colors.green.shade200),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '0', flex: 2),
                _buildButton(label: ','),
                _buildButton(label: '=', color: Colors.green.shade200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDisplay({String result}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        alignment: Alignment.bottomRight,
        child: Text(
          result,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Calculator',
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  _showHistory({String histOperations}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        alignment: Alignment.bottomRight,
        child: Text(
          histOperations,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Calculator',
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  _buildButton({String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label ?? '',
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _controller.applyCommand(label);
          });
        },
      ),
    );
  }
}
