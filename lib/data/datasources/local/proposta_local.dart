import 'package:app_iris/data/models/proposta_model.dart';
import 'package:hive/hive.dart';

class PropostaLocal {
  static const String boxName = 'proposta_box';
  static const String dbName = "propostas";

  late final Box<PropostaModel> box;

  PropostaLocal() {
    box = Hive.box<PropostaModel>(boxName);
  }

  Future<Box<dynamic>> openBox() async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<PropostaModel>(boxName);
    } else {
      return await Hive.openBox<PropostaModel>(boxName);
    }
  }

  Future<void> adicionarProposta(PropostaModel proposta) async {
    await box.put('proposta',proposta);
    await box.compact(); //for the Hive doesn't grow so far
  }

  List<PropostaModel> listar() {
    return box.values.toList().cast<PropostaModel>();
  }

  Future<void> atualizarProposta(int index, PropostaModel proposta) async {
    await box.putAt(index, proposta);
  }


  Future<int?> acessarDadosDaUltimaProposta(String dados) async {
    final box = await Hive.box<PropostaModel>('proposta_box');

    if (box.isEmpty) return null;

    final proposta = box.getAt(box.length - 1);

    switch (dados) {
      case 'valorPsicologo':
        return proposta?.valorPsicologo;
      case 'porcentagem1':
        return proposta?.porcentagem1;
      case 'porcentagem2':
        return proposta?.porcentagem2;
      case 'porcentagem3':
        return proposta?.porcentagem3;
      case 'porcentagemContratacao':
        return proposta?.porcentagemContratacao;
      default:
        throw Exception('Campo "$dados" não encontrado.');
    }
  }
}
