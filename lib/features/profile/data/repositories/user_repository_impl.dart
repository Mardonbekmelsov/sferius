import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/core/error/exception.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/profile/data/datasources/user_datasource.dart';
import 'package:sferius_ai/features/profile/data/models/user_me_model.dart';
import 'package:sferius_ai/features/profile/domain/entities/user_me_entity.dart';
import 'package:sferius_ai/features/profile/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserDatasource userDatasource;
  InternetConnectionChecker internetConnectionChecker;
  LocalConfig localConfig;

  UserRepositoryImpl({
    required this.userDatasource,
    required this.internetConnectionChecker,
    required this.localConfig,
  });
  @override
  Future<Either<Failure, UserMeEntity>> getUser() async {
    try {
      if (await internetConnectionChecker.hasConnection) {
        try {
          log('has connection');
          final userResponse = await userDatasource.getUser();
          localConfig.userLocalSave(userResponse.toJson());
          return Right(userResponse.toEntity());
        } on AuthorizationException {
          return Left(AuthorizationFailure());
        } catch (e) {
          return Left(ServerFailure());
        }
      }
      final localResponse = await localConfig.userLocalget();
      final userModel = UserMeModel.fromJson(localResponse);
      return Right(userModel.toEntity());
    } on AuthorizationException {
      return Left(AuthorizationFailure());
    } catch (e) {
      print('repo error in user repo ${e.toString()}');
      return Left(ServerFailure());
    }
  }
}
