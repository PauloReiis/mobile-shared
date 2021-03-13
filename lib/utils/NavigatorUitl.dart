import 'package:flutter/material.dart';

/// **Conceito:** Util Tratamento de Nagevação entre telas
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class NavigatorUtil {
  /// **Conceito:** Navegar para outra pagina
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  /// **Obs:** [page] Nova Pagina
  /// [replace] se true todas telas serão fechadas e subistuida pela nova [page]
  static void goToPage(BuildContext context, String page, bool replace,
      {Object arguments}) {
    if (replace) {
      Navigator.of(context).pushReplacementNamed(page, arguments: arguments);
    } else {
      Navigator.of(context).pushNamed(page, arguments: arguments);
    }
  }

  /// **Conceito:** Fechar pagina atual
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  static void pop(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  /// **Conceito:** Encaminha para a pagina inicial
  /// **Autor:** Paulo Reis / **Data:** 27/11/2020 / **Versão:** 1.0
  static void goToHome(BuildContext context, String rota) {
    Navigator.of(context).pushReplacementNamed(rota);
  }

  /// **Conceito:** Fecha a pagina atual
  /// **Autor:** Paulo Reis / **Data:** 27/11/2020 / **Versão:** 1.0
  static void goToDispose(BuildContext context) {
    Navigator.of(context).dispose();
  }

  /// **Conceito:** Remove todas as rotas exceto a passada por parametro
  /// **Autor:** Paulo Reis / **Data:** 27/11/2020 / **Versão:** 1.0
  static void goToHomeRemoveUntil(BuildContext context, String rota) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(rota, (Route<dynamic> route) => false);
  }
}
