/// **Conceito:** Explicação da class
/// **Autor:** Paulo Reis / **Data:** DD/MM/YYYY
class ExampleDoc {
  /// **Conceito:** Explicação do metodo
  /// **Autor:** Paulo Reis / **Data:** DD/MM/YYYY / **Versão:** 1.0
  /// **Obs:** Observações
  /// **Retorno:** True = Conectado
  static bool method(String var1, int var2, {bool var3 = false}) {
    if (var2 == null) {
      return false;
    } else {
      return var3;
    }
  }

  /// **Conceito:** Explicação do metodo
  /// **Autor:** Paulo Reis / **Data:** DD/MM/YYYY / **Versão:** 1.0
  static void methodVoid(int var1) {
    int var2;
    if (var2 == null) {
      var2 = var1;
    } else {
      var2--;
    }
  }
}
