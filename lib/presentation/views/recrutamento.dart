import 'package:app_iris/data/providers/recrutamento_provider.dart';
import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recrutamento extends StatefulWidget {
  Recrutamento({super.key});

  @override
  State<Recrutamento> createState() => _RecrutamentoState();
}

class _RecrutamentoState extends State<Recrutamento> {
  PropostaCalculo propostaCalculo = PropostaCalculo.empty();
  RecrutamentoProvider recrutamentoProvider = RecrutamentoProvider();
  TextEditingController _salarioController = TextEditingController();
  var result;
  late bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    var valorContratacao = Provider.of<RecrutamentoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Recrutamento'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Image.asset(
            'lib/data/assets/images/image_iris.png',
          ),
          TextField(
            controller: _salarioController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Salário bruto', icon: Icon(Icons.attach_money)),
          ),
          SizedBox(height: 20), // Espaçamento para melhor visualização
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    // Verificar se o campo não está vazio
                    if (_salarioController.text.isNotEmpty) {
                      // Calcular e atualizar o estado para mostrar o resultado
                       valorContratacao.calcularContratacao(_salarioController.text);
                      // Definir que o resultado deve ser mostrado
                      _isVisible = true;
                    }
                  },
                  child: Text('Calcular'))
            ],
          ),
          Visibility(
            visible: _isVisible,
            child: Text(
              'Valor da contratação: R\$ ${valorContratacao.resultado!.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
