class SentirisCalculoService {
  final int pessoas;
  final double valorPsi;
  final double porcentagem1;
  final double porcentagem2;
  final double porcentagem3;

  SentirisCalculoService({
    required this.pessoas,
    required this.valorPsi,
    required this.porcentagem1,
    required this.porcentagem2,
    required this.porcentagem3,
  });

  double get proposta1 => valorPsi + (valorPsi * (porcentagem1 / 100));

  double get proposta2 => valorPsi + (valorPsi * (porcentagem2 / 100));

  double get proposta3 => valorPsi + (valorPsi * (porcentagem3 / 100));
}
