import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:hive/hive.dart';

import '../../data/models/proposta_model.dart';

class ObterDados{

  PropostaLocal propostaLocal = PropostaLocal();

  Future<PropostaModel?> getPsicologoValue() async{
    final box = await propostaLocal.openBox();
    var value = await box.get('valorPsicologo');
    print(value);
    return value;
  }


}