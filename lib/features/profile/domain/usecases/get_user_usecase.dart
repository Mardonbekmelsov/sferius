import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/core/usecase/usecase.dart';
import 'package:sferius_ai/features/profile/data/repositories/user_repository_impl.dart';
import 'package:sferius_ai/features/profile/domain/entities/user_me_entity.dart';

class GetUserUsecase extends Usecase<UserMeEntity, void> {
  UserRepositoryImpl userRepositoryImpl;
  GetUserUsecase({required this.userRepositoryImpl});
  @override
  Future<Either<Failure, UserMeEntity>> call(void params) async {
    return await userRepositoryImpl.getUser();
  }
}
