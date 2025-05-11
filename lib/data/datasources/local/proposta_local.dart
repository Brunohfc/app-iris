import 'package:app_iris/data/models/proposta_model.dart';
import 'package:hive/hive.dart';

class PropostaLocal{

  static const String boxName = 'proposta_box';
  static const String dbName = "propostas";

  late final Box<PropostaModel> box;

   PropostaLocal(){
     box = Hive.box<PropostaModel>(boxName);
   }

  Future<void> adicionarProposta(PropostaModel proposta) async{
    await box.add(proposta);
  }

  List<PropostaModel> listar() {
    return box.values.toList().cast<PropostaModel>();
  }

  Future<void> atualizarProposta(int index, PropostaModel proposta) async{
    await box.putAt(index, proposta);
  }

}