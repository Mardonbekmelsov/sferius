part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  factory ChatEvent.createChat() = _CreateChat;
  factory ChatEvent.deleteChat(String id) = _DeleteChat;
  factory ChatEvent.joinChat(String chatId) = _JoinChat;
  factory ChatEvent.getAllChats(int userId, AuthenticateBloc authenticateBloc) =
      _GetAllChats;
  factory ChatEvent.newMessageReceived(String message) =
      _NewMessageReceived; // 🔹 New event
  factory ChatEvent.getMessagesByChatId(String chatId) = _GetMessagesByChatId;
  factory ChatEvent.closeChannel() = _CloseChannel;
  factory ChatEvent.sendMessage(String message, String? chatId) = _SendMessage;
  factory ChatEvent.clearMessages() = _ClearMessages;
}
