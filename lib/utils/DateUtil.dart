import 'package:intl/intl.dart';

/// **Conceito:** Util Tratamento de Data
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class DateUtil {
  static const String DD_MM_YYYY = 'dd/MM/yyyy';
  static const String YYYY_MM_DD = 'yyyy-MM-dd';

  /// **Conceito:** Formatar data para texto no formato partir do padrão informado
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  /// **Obs:** Exemplo [newPattern] 'dd/MM/yyyy' -> getFormatDate(DateTime.now(), 'dd/MM/yyyy')
  /// **Retorno:** De acordo com padrão informado
  static String getFormatDate(DateTime date, String newPattern) {
    if (date != null && newPattern != null) {
      return DateFormat(newPattern).format(date);
    }
    return null;
  }

  /// **Conceito:** Formatar data para texto no formato DD/MM/YYYYY
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  /// **Retorno:** DD/MM/YYYYY
  static String getDateUTCBrazil(DateTime date) {
    if (date != null) {
      return DateFormat(DD_MM_YYYY).format(date);
    }
    return null;
  }

  /// **Conceito:** Formatar data para texto no formato YYYY-MM-DD
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  /// **Retorno:** YYYY-MM-DD
  static String getDateUS(DateTime date) {
    if (date != null) {
      return DateFormat(YYYY_MM_DD).format(date);
    }
    return null;
  }

  /// **Conceito:** Converter texto para data no formato DD/MM/YYYY
  /// **Autor:** Paulo Reis / **Data:** 19/10/2020 / **Versão:** 1.1
  /// **Retorno:** DateTime
  static DateTime toDate(String date) {
    if (date != null && date.length >= 10 && date.contains('/')) {
      List<String> splitDate = date.substring(0, 10).split('/');
      return DateTime(int.parse(splitDate[2]), int.parse(splitDate[1]),
          int.parse(splitDate[0]));
    }
    return null;
  }
}
