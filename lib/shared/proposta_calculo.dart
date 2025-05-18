class PropostaCalculo{

  int? _numerosFuncionarios;
  int? _valorPsi;
  int? _porcentagem;


  PropostaCalculo(this._numerosFuncionarios, this._valorPsi, this._porcentagem);

  double calcularProposta() {
    final double adicional = _valorPsi! * _porcentagem! * 2;
    return _valorPsi! + adicional;
  }
  PropostaCalculo.empty();
}