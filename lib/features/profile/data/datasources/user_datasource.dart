import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/error/exception.dart';
import 'package:sferius_ai/features/profile/data/datasources/local_auth_datasources.dart';
import 'package:sferius_ai/features/profile/data/models/user_me_model.dart';

class UserDatasource {
  Dio dio;
  LocalAuthDatasources localAuthDatasources;
  LocalConfig localConfig;

  UserDatasource({
    required this.dio,
    required this.localAuthDatasources,
    required this.localConfig,
  });
  Future<UserMeModel> getUser() async {
    try {
      final token = await localAuthDatasources.getToken();
      String url = '${AppConstants.baseUrl}/users/me';

      final response = await dio.get(
        url,
        options: Options(
          headers: {"Authorization": '$token'},
        ),
      );

      print("user datasource: ${response.data['user']}");

      if (response.data['user']['gender'] == null) {
        response.data['user']['gender'] = 'unknown';
      }

      if (response.statusCode == 200) {
        localConfig.userLocalSave(response.data['user']);
        UserMeModel user = UserMeModel.fromJson(response.data['user']);

        return user;
      } else {
        log('user data error');
        throw ServerException();
      }
    } catch (e) {
      log("user datasource error:  $e");
      throw ServerException();
    }
  }
}
