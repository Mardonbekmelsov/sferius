// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/core/error/exception.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/sfereius/data/datasources/chat_datasource.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/message_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/repository/chat_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ChatEntity>>> getAllChats(int userId) async {
    log("chats repo get chats enter");
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalConfig localConfig = LocalConfig(sharedPreferences: sharedPreferences);

    final token = await localConfig.getToken();

    log("repo got token from local");

    try {
      final fetchedChats = await remoteDataSource.getAllChats(token!);

      List<ChatEntity> chats = [];

      for (var chat in fetchedChats) {
        chats.add(chat.toEntity());
      }

      return Right(chats);
    } on AuthorizationException {
      log("Chat repo auth error");
      return Left(AuthorizationFailure());
    } catch (e) {
      log("repo get chats error : $e");
      return Left(ServerFailure());
    }
  }

  @override
  Stream<String> createChat() async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalConfig localConfig = LocalConfig(sharedPreferences: sharedPreferences);

    try {
      await for (var message in remoteDataSource.createChat()) {
        yield message;
      }
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Stream<String> joinChat(String chatId) async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalConfig localConfig = LocalConfig(sharedPreferences: sharedPreferences);

    final token = await localConfig.getToken();

    try {
      await for (var message in remoteDataSource.joinChat(chatId, token!)) {
        yield message;
      }
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Stream<String> sendMessage(String message, String? chatId) async* {
    log("🔵 Sending: $message");
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalConfig localConfig = LocalConfig(sharedPreferences: sharedPreferences);
    final token = await localConfig.getToken();

    try {
      await for (var msg in remoteDataSource.sendMessage(
        message,
        chatId,
        token,
      )) {
        log("✅ Repo received message: $msg");
        yield msg;
      }
    } catch (e) {
      log("❌ Repo error: $e");
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessagesByChatId(
      String chatId, int userId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    LocalConfig localConfig = LocalConfig(sharedPreferences: sharedPreferences);

    final token = await localConfig.getToken();

    try {
      final fetchedMessages =
          await remoteDataSource.getMessagesByChatId(chatId, token!);
      return Right(fetchedMessages.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  void closeChannel() {
    remoteDataSource.closeConnection();
  }
}
