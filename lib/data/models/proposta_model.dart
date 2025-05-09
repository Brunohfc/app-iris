import 'package:hive/hive.dart';
part 'proposta_model.g.dart';

@HiveType(typeId: 1)
class PropostaModel extends HiveObject {
  @HiveField(0)
  int valorPsicologo;

  @HiveField(1)
  int porcentagem1;

  @HiveField(2)
  int porcentagem2;

  @HiveField(3)
  int porcentagem3;

  @HiveField(4)
  int porcentagemContratacao;

  PropostaModel({
    required this.valorPsicologo,
    required this.porcentagem1,
    required this.porcentagem2,
    required this.porcentagem3,
    required this.porcentagemContratacao,
  });

  @override
  String toString() {
    return 'PropostaModel{valorPsicologo: $valorPsicologo, porcentagem1: $porcentagem1, porcentagem2: $porcentagem2, porcentagem3: $porcentagem3, porcentagemContratacao: $porcentagemContratacao}';
  }
}