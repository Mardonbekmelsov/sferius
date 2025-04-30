part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState({
    @Default(Status.Initial) Status status,
    List<ChatEntity>? chats,
    ChatEntity? chat,
    String? message,
    @Default([]) List<MessageEntity> messageEntities, // Stores final messages
    @Default("") String typingMessage, // 🔹 Shows bot's partial response
  }) = _ChatState;
}
