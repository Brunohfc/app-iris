import 'package:flutter/material.dart';

class PlanoUm extends StatelessWidget {
  const PlanoUm({super.key});

  @override
  Widget build(BuildContext context) {

    final funcionarios = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(

      appBar: AppBar(
        title: Text('Plano 01'),

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
