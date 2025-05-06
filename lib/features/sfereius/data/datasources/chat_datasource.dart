import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/error/exception.dart';
import 'package:sferius_ai/features/sfereius/data/models/chat_model.dart';
import 'package:sferius_ai/features/sfereius/data/models/message_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRemoteDataSource {
  Dio dio;

  ChatRemoteDataSource({required this.dio});

  final String socketUrl =
      "ws://api.ai.sfere.pro/v1/chat/start?user_id=1&chat_id=8a765a7b-a87a-40d2-ab9d-19b318dcc244";
  WebSocketChannel? _channel;
  bool isListening = false;

  WebSocketChannel getChannel() {
    return _channel!;
  }

  Future<List<ChatModel>> getAllChats(String accessToken) async {
    try {
      final url =
          'https://api.ai.sfere.pro/v1/chat/chats/latest?page=1&limit=30';

      print(url);

      final response = await dio.get(
        url,
        options: Options(headers: {"Authorization": accessToken}),
      );

      if (response.data['chats'] == null) {
        response.data['chats'] = [];
      }

      print(response);

      if (response.statusCode == 200) {
        List<ChatModel> chats = [];

        for (var chat in response.data['chats']) {
          chats.add(ChatModel.fromJson(chat));
        }
        print("chaaats: $chats");
        return chats;
      } else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  Future<List<MessageModel>> getMessagesByChatId(
    String chatId,
    String accessToken,
  ) async {
    try {
      final url =
          'https://api.ai.sfere.pro/v1/message/messages?page=1&limit=100&chat_id=$chatId';
      print(url);
      final response = await dio.get(
        url,
        options: Options(headers: {"Authorization": accessToken}),
      );
      print(response);
      if (response.statusCode == 200) {
        List<MessageModel> messages = [];
        for (var message in response.data['messages']) {
          messages.add(MessageModel.fromJson(message));
        }
        return messages;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e.toString());
      throw ServerException();
    }
  }

  Stream<String> createChat() async* {
    try {
      // print('Creating chat for user: $userId...');

      final uri = Uri(
        host: "api.ai.sfere.pro",
        path: "/v1/chat/start",
        scheme: "ws",
      );

      log(uri.toString());

      _channel = IOWebSocketChannel.connect(uri);
      print('Connected to WebSocket');

      // await for (var message in _channel!.stream) {
      //   print("received message: $message");
      //   yield message;
      // }
    } catch (e) {
      print("❌ Error Creating Chat: $e");
      rethrow;
    }
  }

  Future<void> deleteChat(String id, String token) async {
    final url = "https://api.ai.sfere.pro/v1/chat/$id";

    await dio.delete(url, options: Options(headers: {'Authorization': token}));
  }

  /// Sends a message over WebSocket
  Stream<String> sendMessage(
    String message,
    String? chatId,
    String? accessToken,
  ) async* {
    print('📩 Enter remoteDataSource sendMessage');

    try {
      if (_channel == null) {
        log("channel is null");
        final uri =
            chatId != null
                ? Uri(
                  host: "api.ai.sfere.pro",
                  path: "/v1/chat/start",
                  queryParameters: {"chat_id": chatId},
                  scheme: "ws",
                )
                : Uri(
                  host: "api.ai.sfere.pro",
                  path: "/v1/chat/start",
                  scheme: "ws",
                );

        _channel = IOWebSocketChannel.connect(uri);

        log(uri.toString());

        // print(accessToken);
        _channel!.sink.add('{"access_token": "${accessToken ?? ""}"}');
      }

      print("📤 Sending: $message");
      _channel!.sink.add(message);

      // print(_channel!.stream.isBroadcast);

      if (!isListening) {
        isListening = true;
        await for (var message in _channel!.stream
            .cast<String>()
            .asBroadcastStream()
            .skip(1)) {
          log("📩 Received WebSocket message in remoteDataSource: $message");
          yield message;
        }
      }

      // if(_channel!.stream.//////)
    } catch (e) {
      log("❌ Error in remoteDataSource sendMessage: $e");
    }
  }

  /// Joins an existing chat and listens for messages
  Stream<String> joinChat(String chatId, String accessToken) async* {
    print('enter join chat');

    print(accessToken);

    final uri = Uri(
      host: "api.ai.sfere.pro",
      path: "/v1/chat/start",
      queryParameters: {"chat_id": chatId},
      scheme: "ws",
    );

    _channel = IOWebSocketChannel.connect(uri);
    _channel!.sink.add('{"access_token": "$accessToken"}');

    // _channel!.stream.listen((message) async* {
    //   yield message;
    // });

    // await for (var message in _channel!.stream) {
    //   print("received message: $message");
    //   yield message;
    // }
  }

  void closeConnection() {
    _channel?.sink.close();
    isListening = false;
    _channel = null;
  }
}
