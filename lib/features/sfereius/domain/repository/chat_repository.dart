import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Stream<String> createChat();
  Stream<String> joinChat(String chatId);
  Future<Either<Failure, List<ChatEntity>>> getAllChats(int userId);
  Stream<String> sendMessage(String message, String chatID);
  Future<Either<Failure, List<MessageEntity>>> getMessagesByChatId(String chatId, int userId);
  void closeChannel();
  // Stream<ChatEntity> joinChat(int userId, String chatId);
}


// abstract class ChatRepository {
//   Future<Either<Failure, ChatEntity>> createChat(int userId);
//   Stream<ChatModel> joinChat(int userId, String chatId);
//   void sendMessage(String message);
//   Stream<String> listenMessages();
// }
