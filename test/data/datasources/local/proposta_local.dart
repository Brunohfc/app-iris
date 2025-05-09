import 'package:app_iris/core/hive/hive_init.dart';
import 'package:app_iris/data/models/proposta_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main(){

  test("should show database infos", () async{
    WidgetsFlutterBinding.ensureInitialized();
    await HiveInit.init();

    var box = Hive.box<PropostaModel>(HiveInit.boxName);
    var proposta = PropostaModel(
      valorPsicologo: 200,
      porcentagem1: 10,
      porcentagem2: 15,
      porcentagem3: 20,
      porcentagemContratacao: 50,
    );
    await box.add(proposta);
    List<PropostaModel> todas = box.values.toList();
    print(todas.map((ele) => ele));

  });
}