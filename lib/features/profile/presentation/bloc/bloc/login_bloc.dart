// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:go_router/go_router.dart';
import 'package:sferius_ai/core/route/app_router.dart';
import 'package:sferius_ai/features/profile/data/datasources/local_auth_datasources.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LocalAuthDatasources localAuthDatasources;
  LoginBloc(this.localAuthDatasources) : super(LoginInitial()) {
    on<LoginUserEvent>(_login);
    on<LogoutEvent>(_logout);
  }

  void _login(LoginUserEvent event, Emitter emit) async {
    const url =
        'https://api1.sfere.pro/v1/auth/oauth/start?client_name=sferiusai_mobile';
    const callbackUrlScheme =
        "callbacksferiusai"; // ✅ Ensure this matches Android & iOS config

    emit(LoginLoading());

    try {
      final result = await FlutterWebAuth2.authenticate(
        url: url,
        callbackUrlScheme: callbackUrlScheme,
        options: FlutterWebAuth2Options(useWebview: false),
      );

      // log(result);

      Uri uri = Uri.parse(result);

      log(uri.toString());
      String? data = uri.queryParameters['data'];

      log(data.toString());

      final dataMap = jsonDecode(data!);

      log("data map:     $dataMap");

      final accessToken = dataMap['access_token'].toString();
      final sessionId = dataMap['session']['id'].toString();

      log("access_token:   $accessToken");

      log("session id: $sessionId");

      // print(accessToken);
      // log(accessToken.toString());

      localAuthDatasources.setToken(accessToken);
      localAuthDatasources.setSession(sessionId);

      if (accessToken.isNotEmpty) {
        emit(LoginSuccess());
        event.authenticateBloc.add(CheckAuthenticate());
      } else {
        emit(const LoginFailure(message: "Failed to store the token"));
      }
    } catch (e) {
      log("Login error:   ${e.toString()}");
      emit(const LoginFailure(message: "User canceled login"));
    }
  }

  Future<void> _logout(LogoutEvent event, emit) async {
    await localAuthDatasources.removeToken();
    emit(LoginInitial());
  }
}
