import 'package:mobile_shared/utils/MsgConstants.dart';
import 'package:package_info/package_info.dart';

/// **Conceito:** Responsavel para Tratamento de String
/// **Autor:** Paulo Reis / **Data:** 27/10/2020
class StringUtil {
  /// **Conceito:** remove os simbolos do CPF
  /// **Retorno:** String
  /// **Autor:** Paulo Reis  **Data:** 27/10/2020  **Versão:** 1.0
  static String removeMaskCPF(String cpf) {
    if (cpf == null || cpf.isEmpty || cpf == '') {
      throw (MsgConstants.msgValueNotNull);
    }
    return cpf.replaceAll('-', '').replaceAll('.', '');
  }

  /// **Conceito:** obtem a versão do app
  /// **Retorno:** Future<String>
  /// **Autor:** Paulo Reis  **Data:** 27/10/2020  **Versão:** 1.0
  static Future<String> getAppVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  /// **Conceito:** remove os numeros de uma string
  /// **Retorno:** String
  /// **Autor:** Paulo Reis  **Data:** 04/12/2020  **Versão:** 1.0
  static String extractNumbers(String value) {
    return value.replaceAll(RegExp('[^0-9]'), '').trim();
  }
}
