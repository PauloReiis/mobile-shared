import 'package:flutter/material.dart';
import 'package:mobile_shared/utils/ServiceUtil.dart';
import 'package:signalr_core/signalr_core.dart';

/// **Conceito:** Conexão com SignalR
/// **Autor:** Paulo Reis
class SignalRUtil {
  static final instance = SignalRUtil();
  HubConnection _hubConnection;
  MethodInvacationFunc _receiveMessage;

  /// **Conceito:** Preenche [_hubConnection] com a URL para conexão com SignalR
  ///     e preenche [_receiveMessage] com o metodo para transporte das mensagens.
  /// **Autor:** Paulo Reis / **Data:** 22/10/2020 / **Versão:** 1.1
  Future<void> build(String url, MethodInvacationFunc receiveMessage) async {
    _receiveMessage = receiveMessage;
    if (_hubConnection == null) {
      if (url != null) {
        _hubConnection = HubConnectionBuilder().withUrl(url).build();
        await _startConnection();
      }
    } else {
      await checkConnection();
    }
  }

  /// **Conceito:** Verifica sinal de internet e inicia a conexão com o
  ///     servidor SignalR.
  /// **Autor:** Paulo Reis / **Data:** 22/10/2020 / **Versão:** 1.2
  Future<void> _startConnection() async {
    debugPrint('tentando conectar SignalR');
    bool isConected = await ServicesUtil.isConnected();
    if (isConected) {
      try {
        await _hubConnection.start();
      } catch (e) {
        await checkConnection();
      }
    } else {
      debugPrint('Falha na conexão: Sem sinal de Internet');
    }
    await checkConnection();
  }

  /// **Conceito:** Verifica o status da conexão com o servidor SignalR,
  ///     caso a conexão apresente falha, chama o metodo de conectar novamente.
  /// **Autor:** Paulo Reis / **Data:** 22/10/2020 / **Versão:** 1.1
  Future<void> checkConnection() async {
    debugPrint('Testando conexão SignalR');
    if (_hubConnection.state == HubConnectionState.connected) {
      debugPrint('Conexão SignalR feita com sucesso');
      _startReceiveMessage();
    } else {
      debugPrint('Conexão SignalR com falha');
      debugPrint('Reconexão em 30s');
      Future.delayed(Duration(seconds: 30), () async {
        debugPrint('Tentando iniciar reconexão após os 30s');
        await _startConnection();
      });
    }

    _hubConnection.onclose((_) async {
      debugPrint('Conexão perdida');
      await checkConnection();
    });
  }

  /// **Conceito:** Recebe as mensagens do servidor SignalR
  /// **Autor:** Paulo Reis / **Data:** 05/10/2020 / **Versão:** 1.0
  /// **Obs:** Invoca a função [_receiveMessage] passando a mensagem recebida
  void _startReceiveMessage() {
    if (_hubConnection != null && _receiveMessage != null) {
      _hubConnection.on('ReceiveMessege', _receiveMessage);
    }
  }
}
