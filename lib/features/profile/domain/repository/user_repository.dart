import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/profile/domain/entities/user_me_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserMeEntity>> getUser();
}