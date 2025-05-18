import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';

class PlanoTres extends StatelessWidget {
  const PlanoTres({super.key});

  @override
  Widget build(BuildContext context) {

    final funcionarios = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(

      appBar: AppBar(
        title: Text('Plano 03'),

      ),
      body: Column(

        children: [
          Text('Plano com $funcionarios funcionários'),
          Text('Investimento: ')
        ],
      ),
    );
  }
}
