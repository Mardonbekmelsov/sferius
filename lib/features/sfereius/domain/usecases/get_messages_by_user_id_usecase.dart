import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/core/usecase/usecase.dart';
import 'package:sferius_ai/features/sfereius/data/repositories/chat_repository_impl.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/message_entity.dart';

class GetMessagesByUserIdUsecase
    extends Usecase<List<MessageEntity>, GetMessagesParams> {
  ChatRepositoryImpl chatRepositoryImpl;
  GetMessagesByUserIdUsecase({required this.chatRepositoryImpl});
  @override
  Future<Either<Failure, List<MessageEntity>>> call(GetMessagesParams params) {
    return chatRepositoryImpl.getMessagesByChatId(params.chatId, params.userId);
  }
}

class GetMessagesParams {
  int userId;
  String chatId;

  GetMessagesParams({required this.userId, required this.chatId});
}
