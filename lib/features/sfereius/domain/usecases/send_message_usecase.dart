// import 'package:dartz/dartz.dart';
// import 'package:pro_sphere/core/error/failure.dart';
// import 'package:pro_sphere/core/usecase/usecase.dart';
// import 'package:pro_sphere/features/sfereius/domain/repository/chats_repository.dart';

// class SendMessageUsecase {
//   final ChatRepository repository;

//   SendMessageUsecase(this.repository);

//   Future<Either<Failure, void>> call(SendMessageParams params) async {
//     repository.sendMessage(params.message);
//     return Right(null);
//   }
// }

// class SendMessageParams {
//   final String message;
//   // final String userId;
//   // final String chatId;

//   SendMessageParams({
//     required this.message,
//     // required this.chatId,
//     // required this.userId,
//   });
// }
