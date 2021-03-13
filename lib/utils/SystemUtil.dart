import 'dart:io';

import 'package:package_info/package_info.dart';

/// **Conceito:** Traz informacoes a respeito do Sistema do celular
/// **Autor:** Paulo Reis / **Data:** 04/12/2020
class SystemUtil {
  /// **Conceito:** obtem u objeto com informacoes do app
  /// **Retorno:** Future<PackageInfo>
  /// **Autor:** Paulo Reis  **Data:** 04/12/2020  **Versão:** 1.0
  static Future<PackageInfo> getAppInfo() async {
    return await PackageInfo.fromPlatform();
  }

  /// **Conceito:** obtem a versão do app
  /// **Retorno:** Future<String>
  /// **Autor:** Paulo Reis  **Data:** 04/12/2020  **Versão:** 1.0
  static Future<String> getVersion() async {
    PackageInfo asd = await PackageInfo.fromPlatform();
    return asd.version;
  }

  /// **Conceito:** obtem o nome do app
  /// **Retorno:** Future<String>
  /// **Autor:** Paulo Reis  **Data:** 04/12/2020  **Versão:** 1.0
  static Future<String> getAppName() async {
    PackageInfo asd = await PackageInfo.fromPlatform();
    return asd.version;
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
