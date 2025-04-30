// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sferius_ai/core/config/local_config.dart';

class LocalAuthDatasources {
  LocalConfig localConfig;
  LocalAuthDatasources({
    required this.localConfig,
  });

  Future<void> setToken(String token) async {
    return localConfig.setToken(token);
  }

  Future<String?> getToken() async {
    return localConfig.getToken();
  }

  Future<void> removeToken() async {
    await localConfig.removeToken();
  }

  Future<void> setSession(String sessionId) async {
    await localConfig.setSession(sessionId);
  }

  Future<String?> getSession() async {
    return await localConfig.getSession();
  }
}
