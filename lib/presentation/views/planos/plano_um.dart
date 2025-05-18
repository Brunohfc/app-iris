import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/proposta_model.dart';

class PlanoUm extends StatelessWidget {
  PlanoUm({super.key});

  var box = Hive.box<PropostaModel>('proposta_box');
  PropostaLocal propostaLocal = PropostaLocal();
  PropostaCalculo propostaCalculo = PropostaCalculo.empty();

  @override
  Widget build(BuildContext context) {

    final int? funcionarios = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(

      appBar: AppBar(
        title: Text('Plano 01'),

      ),
      body: Column(

        children: [
          Text('Plano com $funcionarios funcionários'),
          Text('Investimento: $funcionarios')
        ],
      ),
    );
  }
}
