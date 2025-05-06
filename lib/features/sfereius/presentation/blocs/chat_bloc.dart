import 'dart:async';
import 'dart:convert';

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';
import 'package:sferius_ai/features/sfereius/data/repositories/chat_repository_impl.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/chat_entity.dart';
import 'package:sferius_ai/features/sfereius/domain/entities/message_entity.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepositoryImpl chatRepositoryImpl;
  StreamSubscription<String>? _chatSubscription;

  ChatBloc(this.chatRepositoryImpl) : super(ChatState()) {
    on<_CreateChat>(_onCreateChat);
    on<_JoinChat>(_onJoinChat);
    on<_GetAllChats>(_onGetAllChats);
    // on<_NewMessageReceived>(_onNewMessageReceived);
    on<_GetMessagesByChatId>(_onGetMessageByChatId);
    on<_SendMessage>(_onSendMessage);
    on<_CloseChannel>(_onCloseChannel);
    on<_ClearMessages>(_onClearMessages);
    on<_DeleteChat>(_onDeleteChat);
  }

  Future<void> _onCreateChat(_CreateChat event, Emitter<ChatState> emit) async {
    print("create chat bloc");
    emit(state.copyWith(status: Status.Loading));
    await _chatSubscription?.cancel();

    try {
      _chatSubscription = chatRepositoryImpl.createChat().listen(
        (message) {
          add(ChatEvent.newMessageReceived(message));
        },
        onError: (error) {
          emit(
            state.copyWith(
              status: Status.Error,
              message: "Failed to create chat",
            ),
          );
        },
      );
      emit(state.copyWith(status: Status.Success));
    } catch (e) {
      emit(
        state.copyWith(status: Status.Error, message: "Failed to create chat"),
      );
    }
  }

  Future<void> _onDeleteChat(_DeleteChat event, emit) async {
    final List<ChatEntity> newList = List.from(state.chats!);
    newList.removeWhere((element) {
      return element.id == event.id;
    });

    await chatRepositoryImpl.deleteChat(event.id);

    emit(state.copyWith(chats: newList));
  }

  Future<void> _onCloseChannel(_CloseChannel event, emit) async {
    chatRepositoryImpl.closeChannel();
    add(ChatEvent.clearMessages());
  }

  Future<void> _onGetMessageByChatId(_GetMessagesByChatId event, emit) async {
    emit(state.copyWith(status: Status.Loading));
    final response = await chatRepositoryImpl.getMessagesByChatId(
      event.chatId,
      1,
    );
    response.fold(
      (error) {
        emit(
          state.copyWith(status: Status.Error, message: _failureMessage(error)),
        );
      },
      (data) {
        emit(state.copyWith(status: Status.Success, messageEntities: data));
      },
    );
  }

  Future<void> _onGetAllChats(
    _GetAllChats event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: Status.Loading));
    final response = await chatRepositoryImpl.getAllChats(event.userId);
    response.fold(
      (error) {
        if (error is AuthorizationFailure) {
          event.authenticateBloc.add(CheckAuthenticate());
        } else {
          emit(
            state.copyWith(
              status: Status.Error,
              message: _failureMessage(error),
            ),
          );
        }
      },
      (data) {
        emit(state.copyWith(status: Status.Success, chats: data));
      },
    );
  }

  Future<void> _onJoinChat(_JoinChat event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: Status.Loading));
    await _chatSubscription?.cancel();

    try {
      _chatSubscription = chatRepositoryImpl
          .joinChat(event.chatId)
          .listen(
            (message) {
              add(ChatEvent.newMessageReceived(message));
            },
            onError: (error) {
              emit(
                state.copyWith(
                  status: Status.Error,
                  message: "Failed to join chat",
                ),
              );
            },
          );
      emit(state.copyWith(status: Status.Success));
    } catch (e) {
      emit(
        state.copyWith(status: Status.Error, message: "Failed to join chat"),
      );
    }
  }

  Future<void> _onSendMessage(
    _SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    print("📡 BLoC получил событие sendMessage");

    try {
      List<MessageEntity> updatedMessages = List.from(state.messageEntities)
        ..insert(0, MessageEntity(role: 'user', content: event.message));

      if (state.typingMessage.isNotEmpty) {
        log("typing message is not empty");
        updatedMessages.insert(
          1,
          MessageEntity(role: 'assistant', content: state.typingMessage),
        );
      }

      // emit(state.copyWith(typingMessage: "gay"));

      emit(state.copyWith(messageEntities: updatedMessages, typingMessage: ""));

      log("1 ${event.message}");

      await for (final msg in chatRepositoryImpl.sendMessage(
        event.message,
        event.chatId,
      )) {
        // String message = jsonDecode(msg);
        print("🟢 BLoC получил слово: $msg");

        // incomingMessage += msg;

        log("inside for");

        emit(state.copyWith(typingMessage: state.typingMessage + msg));

        log(event.message);
      }
    } catch (e) {
      // log("⚠️ Failed to parse message chunk: $e - Chunk: $msg");
      print("❌ Ошибка в BLoC: $e");
      emit(state.copyWith(status: Status.Error));
    }
  }

  void _onClearMessages(_ClearMessages event, emit) {
    emit(
      state.copyWith(
        status: Status.Success,
        messageEntities: [],
        typingMessage: "",
      ),
    );
  }

  // void _onNewMessageReceived(
  //     _NewMessageReceived event, Emitter<ChatState> emit) {
  //   List<String> updatedMessages = List.from(state.messages)
  //     ..add(event.message);
  //   emit(state.copyWith(messages: updatedMessages));
  // }

  String _failureMessage(Failure failure) {
    switch (failure) {
      case ServerFailure():
        return "Server Exception";
      default:
        return "Something went wrong";
    }
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
