import 'package:app_iris/data/models/proposta_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../datasources/local/proposta_local.dart';

class PropostaProvider extends ChangeNotifier{


  final _local = PropostaLocal();

  int _valorPsicologo = 0;
  int _porcentagemUm =0;
  int _porcentagemDois =0;
  int _porcentagemTres =0;
  int _porcentagemContratacao =0;

  // Getters (opcional, se precisar acessar externamente)
  int get valorPsicologo => _valorPsicologo;
  int get porcentagemUm => _porcentagemUm;
  int get porcentagemDois => _porcentagemDois;
  int get porcentagemTres => _porcentagemTres;
  int get porcentagemContratacao => _porcentagemContratacao;


  void setValorPsicologo(String value) {
    if(value.isEmpty){
      return;
    }
    _valorPsicologo = int.tryParse(value.trim()) ?? 0;
    notifyListeners();
  }

  void setPorcentagemUm(String value){
    if(value.isEmpty){
      return;
    }
    _porcentagemUm = int.tryParse(value.trim())!;
    notifyListeners();
  }
  void setPorcentagemDois(String value){
    if(value.isEmpty){
      return;
    }
    _porcentagemDois = int.parse(value);
    notifyListeners();
  }

  void setPorcentagemTres(String value){
    if(value.isEmpty){
      return;
    }
    _porcentagemTres = int.parse(value);
    notifyListeners();
  }

  void setPorcentagemContratacao(String value){
    if(value.isEmpty){
      return;
    }
    _porcentagemContratacao = int.parse(value);
    notifyListeners();
  }

  Future<void> salvarProposta() async{
    final proposta = PropostaModel(
        valorPsicologo: _valorPsicologo,
        porcentagem1: _porcentagemUm,
        porcentagem2: _porcentagemDois,
        porcentagem3: _porcentagemTres,
        porcentagemContratacao: _porcentagemContratacao
    );

    await _local.adicionarProposta(proposta);

  }

  Future<void> limparDados() async {
    final box = await Hive.openBox(PropostaLocal.boxName);
    await box.clear(); // limpa todos os dados
    notifyListeners();
  }

  Future<void> carregarUltimaProposta() async {
    final propostas = _local.listar();
    if (propostas.isNotEmpty) {
      final ultima = propostas.last;
      _valorPsicologo = ultima.valorPsicologo;
      _porcentagemUm = ultima.porcentagem1;
      _porcentagemDois = ultima.porcentagem2;
      _porcentagemTres = ultima.porcentagem3;
      _porcentagemContratacao = ultima.porcentagemContratacao;
      notifyListeners();
    }
  }
}