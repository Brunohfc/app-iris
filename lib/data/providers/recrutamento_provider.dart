import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter/material.dart';

class RecrutamentoProvider extends ChangeNotifier {
  PropostaCalculo propostaCalculo = PropostaCalculo.empty();

  double? _resultado;
  bool _mostrarResultado = false;

  double? get resultado => _resultado;
  bool get mostrarResultado => _mostrarResultado;


  Future<double> calcularContratacao(String salario) async{

    var dados = await propostaCalculo.carregarDados();
    final double valorSalario = double.parse(salario);
     double _resultado = (dados['porcentagemContratacao'] / 100)! * valorSalario;
    _mostrarResultado = true;
    print('O valor do resultado: $_resultado');
    notifyListeners();

    return _resultado;
  }

  void setMostrarResultado(bool mostrar) {
    _mostrarResultado = mostrar;
    notifyListeners();
  }
}