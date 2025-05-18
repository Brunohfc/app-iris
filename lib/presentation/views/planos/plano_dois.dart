import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';

class PlanoDois extends StatelessWidget {
  const PlanoDois({super.key});

  @override
  Widget build(BuildContext context) {
    final funcionarios = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Plano 02'),
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
