// ignore_for_file: unnecessary_overrides

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/error/exception.dart';
import 'package:sferius_ai/features/profile/data/datasources/local_auth_datasources.dart';
import 'package:sferius_ai/service_locator.dart';

class DioConfig {
  final Dio _dio = Dio(BaseOptions(
    // baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ))
    ..interceptors.add(DioInterCeptor());
  get client => _dio;
}

class DioInterCeptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    if (response?.statusCode == 401) {
      log("❗️401 received, attempting to refresh token...");

      try {
        final localAuthDatasource = sl<LocalAuthDatasources>();
        final session = await localAuthDatasource.getSession();

        log("session id in local:   $session");

        if (session == null) {
          log("🔐 No session ID, throwing AuthorizationException");
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              type: DioExceptionType.unknown,
              error: AuthorizationException(),
            ),
          );
        }

        // Perform refresh
        final dio =
            Dio(); // Plain Dio instance, or better: use a properly configured one
        final refreshUrl = "${AppConstants.baseUrl}auth/oauth/refresh";

        final refreshResponse = await dio.get(refreshUrl, queryParameters: {
          "session_id": session,
        });

        if (refreshResponse.statusCode == 200 &&
            refreshResponse.data['access_token'] != null) {
          final newToken = refreshResponse.data['access_token'];
          final newSession = refreshResponse.data['sesion']['id'];
          await localAuthDatasource.setToken(newToken);
          await localAuthDatasource.setSession(newSession);

          log("new token:  $newToken");
          log("new session : $newSession");

          // log("✅ Token refreshed, retrying original request...");

          // Clone original request
          final requestOptions = err.requestOptions;
          requestOptions.headers["Authorization"] = newToken;

          String newUrl = requestOptions.uri.toString();

          final retryDio = Dio(); // Again, use configured Dio if possible

          if (newUrl.contains("me")) {
            newUrl = "https://api1.sfere.pro/v1/users/me";
          } else if (newUrl.contains("")) {}

          log('request options in re getting:  ---------------- ${requestOptions.uri.toString()}');
          log("new token:  $newToken");

          log("getting url:  $newUrl");

          final retriedResponse = await retryDio.get(newUrl,
              options: Options(headers: {"Authorization": newToken}));

          return handler.resolve(retriedResponse);
        } else {
          log("❌ Refresh failed, removing token...");
          await localAuthDatasource.removeToken();
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              type: DioExceptionType.badResponse,
              error: AuthorizationException(),
            ),
          );
        }
      } catch (e) {
        log("❌ Error during token refresh: $e");
        await sl<LocalAuthDatasources>().removeToken();

        // router.go('profile');
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            type: DioExceptionType.unknown,
            error: AuthorizationException(),
          ),
        );
      }
    }

    // Pass all other errors through
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // You can optionally attach token here if needed
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
