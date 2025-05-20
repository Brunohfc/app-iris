import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';

class RecrutamentoProvider extends ChangeNotifier {
  PropostaCalculo propostaCalculo = PropostaCalculo.empty();

  double? _resultado = 0;


  double? get resultado => _resultado;



  Future<void> calcularContratacao(String salario) async{

    var dados = await propostaCalculo.carregarDados();
    final double valorSalario = double.parse(salario);
    _resultado = (dados['porcentagemContratacao'] / 100)! * valorSalario;

    notifyListeners();

  }

}