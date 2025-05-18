
import 'dart:io';

import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:app_iris/data/models/proposta_model.dart';
import 'package:app_iris/shared/proposta_calculo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;

void main(){
  
  test('should return 65', (){
    final proposta = PropostaCalculo(10, 50, 15);
    expect(proposta.calcularProposta(), 65.0);
  });

  setUp(() async {
    final dir = Directory.current;
    Hive.init(path.join(dir.path, 'test_hive'));

    // Registrar o adapter antes de abrir a box
    Hive.registerAdapter(PropostaModelAdapter());

    await Hive.openBox<PropostaModel>('proposta_box');
  });

  tearDown(() async {
    await Hive.box<PropostaModel>('proposta_box').clear();
    await Hive.box<PropostaModel>('proposta_box').close();
  });

  test('should return porcentagem1 from last proposal', () async {
    final box = Hive.box<PropostaModel>('proposta_box');

    await box.add(PropostaModel(
      valorPsicologo: 100,
      porcentagem1: 15,
      porcentagem2: 12,
      porcentagem3: 10,
      porcentagemContratacao: 5,
    ));

    final propostaLocal = PropostaLocal(); // classe que acessa Hive
    final resultado = await propostaLocal.acessarDadosDaUltimaProposta('porcentagem1');

    expect(resultado, 15);
  });

}