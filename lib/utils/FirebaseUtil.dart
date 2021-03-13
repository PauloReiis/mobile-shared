

/// **Conceito:** Conexão com Firebase
/// **Autor:** Paulo Reis
class FirebaseUtil {
  /*FirebaseUtil._privateConstructor();

  static final FirebaseUtil _instance = FirebaseUtil._privateConstructor();

  static FirebaseUtil get instance => _instance;
  static FirebaseMessaging _firebaseMessaging;

  factory FirebaseUtil() {
    return _instance;
  }

  /// **Conceito:** inicializa os metodos do Firebase.
  /// **Autor:** Paulo Reis / **Data:** 05/10/2020 / **Versão:** 1.0
  Future<String> initMethodFirebase() async {
    //_firebaseMessaging = FirebaseMessaging();

    await getPermissionNotification();
    return await _getTokenFirebase();
  }

  /// **Conceito:** Obtendo permissão para usar o Push Notificatio do Firebase
  ///     no IOS e exibe modal caso a permissão seja negada
  /// **Autor:** Paulo Reis / **Data:** 03/12/2020 / **Versão:** 1.2
  Future<void> getPermissionNotification({BuildContext context}) async {
    debugPrint('getPermissionNotification');
    if (Platform.isIOS) {
      debugPrint('Sistema Operacional IOS');
      debugPrint('Solicitando permissão para notificação no IOS.');
      bool isPermission = await _firebaseMessaging
          .requestNotificationPermissions(const IosNotificationSettings(
              sound: true, badge: true, alert: true));
      if (isPermission) {
        debugPrint('Permissão para notificação no IOS realizada com sucesso.');
      } else {
        debugPrint(
            'Permissão para notificação no IOS negada, solicitando nova permissão');
        if (context != null) {
          DialogUtil().mountDialog(
              context, Constant.attention, 'Quer ativar notificacao?',
              blocked: true,
              customHeader: DialogUtil.errorHeader(Constant.attention),
              textButton: Constant.ok,
              onButtonPressed: () {
                Navigator.of(context).pop();
                AppSettings.openNotificationSettings();
              },
              errorButton: Constant.cancel,
              onErrorButton: () => Navigator.of(context).pop());
        }
      }
    } else {
      debugPrint('Sistema Operacional ANDROID');
    }
  }

  /// **Conceito:** Obter token do Firebase
  /// **Autor:** Paulo Reis / **Data:** 05/10/2020 / **Versão:** 1.0
  Future<String> _getTokenFirebase() async {
    debugPrint('getTokenFirebase');
    _firebaseMessaging ??= FirebaseMessaging();
    String token = await _firebaseMessaging.getToken();
    debugPrint('Token Firebase: $token');
    return token;
  }

  /// **Conceito:** Receber mensagens e executar uma ação.
  /// **Autor:** Paulo Reis / **Data:** 28/10/2020 / **Versão:** 1.3
  /// **Obs:**
  /// Parametro[appForeground] será executado quando o App estiver em primeiro plano
  /// Parametro[appBackground] será executado quando o App estiver em segundo plano
  /// Parametro[appClosed] será executado quando o App estiver fechado
  void configureFirebase(
      {BuildContext context,
      Function appForeground,
      Function appBackground,
      Function appClosed}) {
    debugPrint('getMessage');
    _firebaseMessaging ??= FirebaseMessaging();
    FirebaseMessaging.instance.configure(
        //Receber mensagem com o app em primeiro plano
        onMessage: (Map<String, dynamic> message) async {
      debugPrint('received message $message');
      appForeground(message, context);
      //Receber mensagem com o app em segundo plano
    }, onResume: (Map<String, dynamic> message) async {
      debugPrint('on resume $message');
      appBackground(message, context);
      //Receber mensagem com o app fechado
    }, onLaunch: (Map<String, dynamic> message) async {
      debugPrint('on launch $message');
      appClosed(message, context);
    });
  }*/
}
