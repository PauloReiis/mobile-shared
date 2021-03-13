class LatLng {
  /*double latitude;
  double longitude;

  LatLng({@required this.latitude, @required this.longitude});

  @override
  String toString() => 'Lat: $latitude | Long: $longitude';*/
}

/// **Conceito:** Util Tratamento de Localização
/// **Autor:** Paulo Reis / **Data:** 09/10/2020
class LocationUtil {
  /*/// **Conceito:** Verifica se há permissao de localização
  /// **Retorno:** Future<bool>
  /// **Autor:** Paulo Reis  **Data:** 26/10/2020  **Versão:** 1.0
  static Future<bool> hasPermission() async {
    return await Location().hasPermission() == PermissionStatus.granted;
  }

  /// **Conceito:** Pede a permissão da localização
  /// **Retorno:** Future<PermissionStatus>
  /// **Autor:** Paulo Reis  **Data:** 26/10/2020  **Versão:** 1.0
  static Future<PermissionStatus> requestPermission() async {
    return await Location().requestPermission();
  }

  /// **Conceito:** Verifica se há permissao de localização está negada
  /// **Retorno:** Future<bool>
  /// **Autor:** Paulo Reis  **Data:** 26/10/2020  **Versão:** 1.0
  static Future<bool> requestIsDenied() async {
    return await Location().hasPermission() == PermissionStatus.denied;
  }

  /// **Conceito:** Obtem a localização atual
  /// **Retorno:** Future<bool>
  /// **Autor:** Paulo Reis  **Data:** 26/10/2020  **Versão:** 1.0
  static Future<LatLng> getCurrentLocation() async {
    LocationData locationData = await Location().getLocation();
    return LatLng(
        latitude: locationData.latitude, longitude: locationData.longitude);
  }*/
}
