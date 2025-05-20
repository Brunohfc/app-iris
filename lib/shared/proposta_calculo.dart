import 'package:app_iris/data/datasources/local/proposta_local.dart';
import 'package:app_iris/shared/helpers/comun_base_calc.dart';

class PropostaCalculo {
  PropostaLocal propostaLocal = PropostaLocal();

  int? _valorPsi;
  int? _porcentagem;

  PropostaCalculo(this._valorPsi, this._porcentagem);

  Future<double> calcularProposta(String qualPorcentagem) async {
    var dados = await carregarDados();

    int valorPsi = dados['valorPsi'];
    int porcentagem = dados['porcentagem$qualPorcentagem'];

    final double adicional = valorPsi * ((ComunCalc.paraUso(porcentagem) * 2) /100);

    return valorPsi + adicional;
  }

  PropostaCalculo.empty();

  Future<Map<String, dynamic>> carregarDados() async {
    final int valorPsi =
        await propostaLocal.acessarDadosDaUltimaProposta('valorPsicologo') ?? 0;
    final int porcentagem1 =
        await propostaLocal.acessarDadosDaUltimaProposta('porcentagem1') ?? 0;
    final int porcentagem2 =
        await propostaLocal.acessarDadosDaUltimaProposta('porcentagem2') ?? 0;
    final int porcentagem3 =
        await propostaLocal.acessarDadosDaUltimaProposta('porcentagem3') ?? 0;
    final int porcentagemContratacao = await propostaLocal
            .acessarDadosDaUltimaProposta('porcentagemContratacao') ??
        0;

    return {
      'valorPsi': valorPsi,
      'porcentagem1': porcentagem1,
      'porcentagem2': porcentagem2,
      'porcentagem3': porcentagem3,
      'porcentagemContratacao': porcentagemContratacao
    };
  }
}
