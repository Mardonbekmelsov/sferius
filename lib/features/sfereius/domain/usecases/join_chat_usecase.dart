// import 'package:dartz/dartz.dart';
// import 'package:pro_sphere/core/error/failure.dart';
// import 'package:pro_sphere/features/sfereius/data/models/chat_model.dart';
// import 'package:pro_sphere/features/sfereius/domain/entities/chat_entity.dart';
// import 'package:pro_sphere/features/sfereius/domain/repository/chats_repository.dart';

// class JoinChatUsecase {
//   final ChatRepository repository;

//   JoinChatUsecase(this.repository);

//   Stream<Either<Failure, ChatModel>> call(JoinChatParams params) {
//     return repository.joinChat(params.userId, params.chatId).map(
//           (chatEntity) => Right(chatEntity), // Wrap in Either Right
//         );
//   }
// }

// class JoinChatParams {
//   final int userId;
//   final String chatId;

//   JoinChatParams({
//     required this.userId,
//     required this.chatId,
//   });
// }
