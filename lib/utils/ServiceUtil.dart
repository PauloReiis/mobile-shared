import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shared/constant/MessageConstants.dart';
import 'package:mobile_shared/enums/EnumUtil.dart';

/// **Conceito:** Responsavel para Tratamento de API
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class ServicesUtil {
  static const content = 'Content-Type';
  static const typeJson = 'application/json';
  static const intranet = 'intranet';
  static const int timeoutDefault = 60;

  /// **Conceito:** Verifica conexão com internet
  /// **Autor:** Paulo Reis / **Data:** 01/10/2020 / **Versão:** 1.0
  /// **Retorno:** True = Conectado
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  /// **Conceito:** Requisição da API Rest
  /// **Obs:** [isHttp] true HTTP / false HTTPS
  ///  [host] Host da URL, [rest] Tipo da solicitação (POST, PUT ou GET),
  ///  [uri] URI da URL, [json] Json a ser enviado ao serviço,
  ///  [msgConnection] Mensagem de erro com a internet,
  ///  [msgTimeOut] Mensagem de erro de Time Out,
  ///  [msgFailure] Mensagem quando da erro no serviço,
  ///  [qParam] Recebe os dados da requisição como parâmetro na URL
  /// **Retorno:** Body convertido em JSON
  /// **Autor:** Paulo Reis / **Data:** 26/11/2020 / **Versão:** 1.3
  static Future<dynamic> callService(
      bool isHttp, String host, TypeRest rest, String uri,
      {String json,
      String msgConnection = MessageConstant.connectionError,
      String msgTimeOut = MessageConstant.timeout,
      String msgFailure = MessageConstant.communicationError,
      Map<String, String> qParam}) async {
    debugPrint('callService');

    if (!await isConnected()) {
      throw msgConnection;
    }

    String url = isHttp
        ? Uri.http(host, uri, qParam).toString()
        : Uri.https(host, uri, qParam).toString();
    debugPrint('Link de conexão -> $url');
    Map<String, String> headers = {ServicesUtil.content: ServicesUtil.typeJson};
    Duration duration = Duration(seconds: timeoutDefault);

    http.Response response;

    switch (rest) {
      case TypeRest.POST:
        debugPrint('callService -> POST -> $json');
        response = await http
            .post(url, headers: headers, body: json)
            .timeout(duration, onTimeout: () => throw (msgTimeOut));
        break;

      case TypeRest.PUT:
        debugPrint('callService -> PUT -> $json');
        response = await http
            .put(url, headers: headers, body: json)
            .timeout(duration, onTimeout: () => throw (msgTimeOut));
        break;

      case TypeRest.GET:
        debugPrint('callService -> GET');
        response = await http
            .get(url, headers: headers)
            .timeout(duration, onTimeout: () => throw (msgTimeOut));
        break;

      default:
        {
          debugPrint('callService -> default');
          break;
        }
    }

    if (response.statusCode != 200) {
      throw msgFailure;
    }
    debugPrint('callService Response -> ${response.body}');
    return jsonDecode(response.body);
  }

  /// **Conceito:** obter o endereco IP do aparelho celular
  /// **Retorno:** Future<String>
  /// **Autor:** Paulo Reis  **Data:** 27/10/2020  **Versão:** 1.0
  static Future<String> getIPAddress() async {
    final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4, includeLinkLocal: true);

    try {
      NetworkInterface vpnInterface =
          interfaces.firstWhere((element) => element.name == 'tun0');
      return vpnInterface.addresses.first.address;
    } on StateError {
      // No VPN connection
      try {
        NetworkInterface interface =
            interfaces.firstWhere((element) => element.name != 'tun0');
        return interface.addresses.first.address;
      } catch (ex) {
        return null;
      }
    }
  }
}
