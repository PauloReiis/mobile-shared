import 'package:enum_to_string/enum_to_string.dart';

/// **Conceito:** Util Tratamento de Object
/// **Autor:** Paulo Reis / **Data:** 13/10/2020
class ObjectUtil {
  /// **Conceito:** Tratamento de objeto boleano
  /// **Autor:** Paulo Reis / **Data:** 13/10/2020 / **Versão:** 1.0
  /// **Retorno:** Se [value] estiver nulo retorna falso senão retorna [value]
  static bool validBool(bool value) {
    return value ?? false;
  }

  /// **Conceito:** Converte Enum para String
  /// **Autor:** Paulo Reis / **Data:** 13/10/2020 / **Versão:** 1.0
  static String enumToString(value) {
    return value != null ? EnumToString.convertToString(value) : null;
  }

  /// **Conceito:** Converte String para Enum
  /// **Autor:** Paulo Reis / **Data:** 13/10/2020 / **Versão:** 1.0
  /// **Obs:** Obrigatorio passar a lista de [enumValues]EnumExemplo.values() e [value]
  static T stringToEnum<T>(List<T> enumValues, value) {
    return (enumValues != null && value != null)
        ? EnumToString.fromString(enumValues, value)
        : null;
  }

  /// **Conceito:**  Converte String para Numero inteiro removendo letras e caracteres especiais
  /// **Autor:** Paulo Reis / **Data:** 13/10/2020 / **Versão:** 1.0
  /// **Obs:** Exemplo: 123.456.789-12 -> 12345678912
  static String extractNumbers(String value) =>
      value.replaceAll(RegExp('[^0-9]'), '').trim();

  /// **Conceito:** Montar texto com paramentro, substituindo palavras[key] por valores[value]
  /// **Autor:** Paulo Reis / **Data:** 14/10/2020 / **Versão:** 1.1
  /// **Obs:** Example [msg] = Ocorreu um erro param1 e no param2
  /// [mapParamValues] {"param1": _param1, "param2": _param2}
  static String mountTextWithParameters(
      String text, Map<String, dynamic> mapParamValues) {
    if (mapParamValues != null && mapParamValues.isNotEmpty) {
      mapParamValues.forEach((key, value) {
        if (value != null) {
          text = text.replaceFirst(key, value.toString());
        }
      });
    }
    return text;
  }
}
