import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/core/usecase/usecase.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/repository/chat_repository.dart';

class GetAllChatsUsecase extends Usecase<List<ChatEntity>, GetChatsParams> {
  ChatRepository chatRepository;

  GetAllChatsUsecase({required this.chatRepository});
  @override
  Future<Either<Failure, List<ChatEntity>>> call(GetChatsParams params) {
    return chatRepository.getAllChats(params.userId);
  }
}

class GetChatsParams {
  final int userId;

  GetChatsParams({required this.userId});
}
