import 'package:flutter/material.dart';
import 'package:mobile_shared/constant/Constant.dart';
import 'package:mobile_shared/constant/MessageConstants.dart';
import 'package:mobile_shared/constant/StyleConstant.dart';

/// **Conceito:** Util Tratamento de Widget
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class WidgetUtil {
  /// **Conceito:** Obter largura da tela por porcetagem
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  static double widthPercentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.width / 100) * percentage;
  }

  /// **Conceito:** Obter altura da tela por porcetagem
  /// **Autor:** Paulo Reis / **Data:** 09/10/2020 / **Versão:** 1.0
  static double heightPercentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }

  /// **Conceito:** Criar um Widget que se forma na tela inteira simulando um bloqueido de tela
  /// **Autor:** Paulo Reis / **Data:** 30/11/2020 / **Versão:** 1.1
  static Widget addBlock(BuildContext context, bool block) {
    return Visibility(
        visible: block ?? false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black12,
          child: Center(child: CircularProgressIndicator()),
        ));
  }

  /// **Conceito:** Retonar Decaração Personalizada para Campos padrão PM
  /// **Autor:** Paulo Reis / **Data:** 29/10/2020 / **Versão:** 1.0
  static InputDecoration buildInputDecoration(String label,
      {bool isHint = true}) {
    return InputDecoration(
      counterText: Constant.empty,
      labelText: label,
      labelStyle: TextStyle(color: Colors.white),
      hintText: isHint ? 'Digite o $label' : null,
      hintStyle: TextStyle(color: Colors.white38),
      contentPadding:
          EdgeInsets.only(bottom: 5.0, left: 2.0, right: 2.0, top: 20),
      isDense: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    );
  }

  /// **Conceito:** Criar um header do CUD personalizado padrão PM
  /// **Autor:** Paulo Reis / **Data:** 29/10/2020 / **Versão:** 1.0
  static Widget addHeaderPM(
      BuildContext context, String appName, String version, String pathImage) {
    return Column(children: [
      Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(pathImage),
          ))),
      Text(appName,
          style: StyleConstant.styleTextWhiteBold,
          textAlign: TextAlign.center),
      Text(version,
          style: StyleConstant.styleTextWhiteBold,
          textAlign: TextAlign.center)
    ]);
  }

  /// **Conceito:** Validação para Campos - Inputs
  /// **Autor:** Paulo Reis / **Data:** 30/10/2020 / **Versão:** 1.0
  static String validatorTextField(String value,
      {bool special = false, String msgSpecial}) {
    return value.isEmpty
        ? MessageConstant.formRequiredField
        : special ? msgSpecial : null;
  }
}
