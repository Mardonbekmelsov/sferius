// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalConfig {
  SharedPreferences sharedPreferences;
  LocalConfig({required this.sharedPreferences});

  Future<void> setSession(String sessionId) async {
    await sharedPreferences.setString("session", sessionId);
  }

  Future<String?> getSession() async {
    return sharedPreferences.getString("session");
  }

  Future<void> setLocale(Locale locale) async {
    await sharedPreferences.setString('language_code', locale.languageCode);
  }

  String getLocale() {
    return sharedPreferences.getString("language_code") ?? '';
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString(AppConstants.sharedToToken, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.sharedToToken);
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove(AppConstants.sharedToToken);
  }

  Future<void> setCategoryList(int category) async {
    print('enter local config set');

    await sharedPreferences.setInt('category', category);
  }

  Future<void> userLocalSave(Map<String, dynamic> user) async {
    final saveUser = jsonEncode(user);
    await sharedPreferences.setString('user', saveUser);
  }

  Future<dynamic> userLocalget() async {
    final user = sharedPreferences.getString('user');
    log("user in local: $user");
    final response = jsonDecode(user ?? '');
    return response;
  }

  Future<void> setTextSize(double size) async {
    sharedPreferences.setDouble("textSize", size);
  }

  Future<double> getTextSize() async {
    final size = await sharedPreferences.getDouble("textSize");

    return size ?? 16;
  }
}
