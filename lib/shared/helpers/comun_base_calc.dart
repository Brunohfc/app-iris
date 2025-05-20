class ComunCalc {

  static int valueToSave(double value) {
    try {
      if (value != null) {
        return (value * 100).round();
      }
    } catch (e) {
      print('an error occurred');
    }

    return -1;
  }

  static double paraUso(int armazenado) {
    return armazenado / 100;
  }

  static int porcentagemParaInt(String valor) {
    valor = valor.replaceAll(',', '.');
    double valorDouble = double.tryParse(valor) ?? 0.0;
    return (valorDouble * 100).round();
  }
}
