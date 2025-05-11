import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:flutter/material.dart';

class SentirisPage extends StatefulWidget {
  SentirisPage({super.key});

  @override
  State<SentirisPage> createState() => _SentirisPageState();
}

class _SentirisPageState extends State<SentirisPage> {
  TextEditingController _funcionariosController = TextEditingController();

  PropostaLocal propostaLocal = PropostaLocal();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentiris'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          SizedBox(
            width: 250,
            child: Image.asset('lib/data/assets/images/logo.png'),
          ),
          TextField(
            controller: _funcionariosController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Número funcionarios',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/planoUm',
                        arguments: _funcionariosController.text.isNotEmpty
                            ? _funcionariosController.text
                            : _funcionariosController.text = '0');
                  },
                  child: Text('Proposta 1')),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, 'planoDois', arguments:
                _funcionariosController.text.isNotEmpty
                    ? _funcionariosController.text
                    : _funcionariosController.text = '0');
              }, child: Text('Proposta 2')),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/planoTres', arguments:
                _funcionariosController.text.isNotEmpty
                    ? _funcionariosController.text
                    : _funcionariosController.text = '0'
                );
              }, child: Text('Proposta 3')),
            ],
          ),
          TextButton(onPressed: () {}, child: Text('Voltar')),
        ],
      ),
    );
  }
}
