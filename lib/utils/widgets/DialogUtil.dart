

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_shared/constant/Constant.dart';
import 'package:mobile_shared/constant/MessageConstants.dart';

/// **Conceito:** Util Montagem Dialog
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class DialogUtil {
  /// **Conceito:** Montar Dialog
  /// **Autor:** Paulo Reis / **Data:** 19/10/2020 / **Versão:** 2.1
  /// **Obs:** [textButton] Nome Botão, [onButtonPressed] função do botão
  /// [customHeader] Cabeçalho do Dialog, [blocked] se true será modal bloqueado
  static void mountDialog(BuildContext context, String title, String msg,
      {String textButton,
        Function onButtonPressed,
        String errorButton,
        Function onErrorButton,
        Widget customHeader,
        bool blocked}) {
    msg =
    msg != null && msg.isNotEmpty ? msg : MessageConstant.unexpectedError;
    title = title != null && title.isNotEmpty ? title : Constant.attention;
    customHeader = customHeader ?? _baseHeader(title, Colors.black);
    bool barrierDismissible = blocked != null ? !blocked : true;

    List<Widget> actions = onButtonPressed != null || onErrorButton != null
        ? <Widget>[
      onButtonPressed != null
          ? TextButton(
          onPressed: onButtonPressed,
          child: Text(textButton ?? Constant.ok))
          : null,
      onErrorButton != null
          ? TextButton(
          onPressed: onErrorButton,
          child: Text(errorButton ?? Constant.cancel))
          : null
    ]
        : null;

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(5),
          elevation: 4,
          title: customHeader,
          content: Text(
            msg,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: actions,
        );
      },
    );
  }

  /// **Conceito:** Montar Cabeçalho Erro do Dialog
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  static Widget errorHeader(String title) {
    return _baseHeader(title, Colors.red);
  }

  /// **Conceito:** Montar Cabeçalho de Sucesso do Dialog
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  static Widget successHeader(String title) {
    return _baseHeader(title, Colors.green);
  }

  /// **Conceito:** Montar Cabeçalho Dialog
  /// **Autor:** Paulo Reis / **Data:** 19/10/2020 / **Versão:** 1.1
  static Widget _baseHeader(String title, Color color) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      color: color,
    );
  }

  /// **Conceito:** Mostra a mensagem em um componente de Toast
  /// **Autor:** Paulo Reis / **Data:** 26/11/2020 / **Versão:** 1.0
  static void mountToast(String message,
      {fontSize = 16.0,
        background = Colors.black54,
        textColor = Colors.white,
        position = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        timeInSecForIosWeb: 1,
        backgroundColor: background,
        textColor: textColor,
        fontSize: fontSize);
  }

  /// **Conceito:** Mostra a mensagem em um componente de SnackBar
  /// **Autor:** Paulo Reis / **Data:** 26/11/2020 / **Versão:** 1.0
  static SnackBar mountSnackBar(BuildContext context, message,
      {int type = 0,
        textColor = Colors.white,
        background = Colors.green,
        second = 5}) {
    if (type == 1) { //Error Message
      textColor = Colors.white;
      background = Colors.red;
    } else if (type == 2) { //Atention Message
      textColor = Colors.black;
      background = Colors.yellowAccent;
    }
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: background,
      duration: Duration(seconds: second),
    );
  }
}
