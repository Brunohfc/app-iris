import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';


class PlanoUm extends StatelessWidget {
  PlanoUm({super.key});

  PropostaCalculo propostaCalculo = PropostaCalculo.empty();

  @override
  Widget build(BuildContext context) {
    final int? funcionarios =
        ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      appBar: AppBar(title: Text('Plano Um')),
      body: FutureBuilder<double>(
        future: propostaCalculo.calcularProposta('1'), // passa '1', '2' ou '3'
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final resultado = snapshot.data! * funcionarios!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Resultado: R\$ ${resultado.toStringAsFixed(2)}'),
              ),
              Text('Número de funcionários: $funcionarios'),
            ],
          );
        },
      ),
    );
  }
}
