// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// @nodoc


class _CreateChat implements ChatEvent {
   _CreateChat();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.createChat()';
}


}




/// @nodoc


class _DeleteChat implements ChatEvent {
   _DeleteChat(this.id);
  

 final  String id;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteChatCopyWith<_DeleteChat> get copyWith => __$DeleteChatCopyWithImpl<_DeleteChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteChat&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ChatEvent.deleteChat(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteChatCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$DeleteChatCopyWith(_DeleteChat value, $Res Function(_DeleteChat) _then) = __$DeleteChatCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteChatCopyWithImpl<$Res>
    implements _$DeleteChatCopyWith<$Res> {
  __$DeleteChatCopyWithImpl(this._self, this._then);

  final _DeleteChat _self;
  final $Res Function(_DeleteChat) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteChat(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _JoinChat implements ChatEvent {
   _JoinChat(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinChatCopyWith<_JoinChat> get copyWith => __$JoinChatCopyWithImpl<_JoinChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinChat&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatEvent.joinChat(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$JoinChatCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$JoinChatCopyWith(_JoinChat value, $Res Function(_JoinChat) _then) = __$JoinChatCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class __$JoinChatCopyWithImpl<$Res>
    implements _$JoinChatCopyWith<$Res> {
  __$JoinChatCopyWithImpl(this._self, this._then);

  final _JoinChat _self;
  final $Res Function(_JoinChat) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(_JoinChat(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetAllChats implements ChatEvent {
   _GetAllChats(this.userId, this.authenticateBloc);
  

 final  int userId;
 final  AuthenticateBloc authenticateBloc;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllChatsCopyWith<_GetAllChats> get copyWith => __$GetAllChatsCopyWithImpl<_GetAllChats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllChats&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.authenticateBloc, authenticateBloc) || other.authenticateBloc == authenticateBloc));
}


@override
int get hashCode => Object.hash(runtimeType,userId,authenticateBloc);

@override
String toString() {
  return 'ChatEvent.getAllChats(userId: $userId, authenticateBloc: $authenticateBloc)';
}


}

/// @nodoc
abstract mixin class _$GetAllChatsCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$GetAllChatsCopyWith(_GetAllChats value, $Res Function(_GetAllChats) _then) = __$GetAllChatsCopyWithImpl;
@useResult
$Res call({
 int userId, AuthenticateBloc authenticateBloc
});




}
/// @nodoc
class __$GetAllChatsCopyWithImpl<$Res>
    implements _$GetAllChatsCopyWith<$Res> {
  __$GetAllChatsCopyWithImpl(this._self, this._then);

  final _GetAllChats _self;
  final $Res Function(_GetAllChats) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? authenticateBloc = null,}) {
  return _then(_GetAllChats(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,null == authenticateBloc ? _self.authenticateBloc : authenticateBloc // ignore: cast_nullable_to_non_nullable
as AuthenticateBloc,
  ));
}


}

/// @nodoc


class _NewMessageReceived implements ChatEvent {
   _NewMessageReceived(this.message);
  

 final  String message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewMessageReceivedCopyWith<_NewMessageReceived> get copyWith => __$NewMessageReceivedCopyWithImpl<_NewMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.newMessageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NewMessageReceivedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$NewMessageReceivedCopyWith(_NewMessageReceived value, $Res Function(_NewMessageReceived) _then) = __$NewMessageReceivedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NewMessageReceivedCopyWithImpl<$Res>
    implements _$NewMessageReceivedCopyWith<$Res> {
  __$NewMessageReceivedCopyWithImpl(this._self, this._then);

  final _NewMessageReceived _self;
  final $Res Function(_NewMessageReceived) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NewMessageReceived(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetMessagesByChatId implements ChatEvent {
   _GetMessagesByChatId(this.chatId);
  

 final  String chatId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMessagesByChatIdCopyWith<_GetMessagesByChatId> get copyWith => __$GetMessagesByChatIdCopyWithImpl<_GetMessagesByChatId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMessagesByChatId&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,chatId);

@override
String toString() {
  return 'ChatEvent.getMessagesByChatId(chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$GetMessagesByChatIdCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$GetMessagesByChatIdCopyWith(_GetMessagesByChatId value, $Res Function(_GetMessagesByChatId) _then) = __$GetMessagesByChatIdCopyWithImpl;
@useResult
$Res call({
 String chatId
});




}
/// @nodoc
class __$GetMessagesByChatIdCopyWithImpl<$Res>
    implements _$GetMessagesByChatIdCopyWith<$Res> {
  __$GetMessagesByChatIdCopyWithImpl(this._self, this._then);

  final _GetMessagesByChatId _self;
  final $Res Function(_GetMessagesByChatId) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chatId = null,}) {
  return _then(_GetMessagesByChatId(
null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CloseChannel implements ChatEvent {
   _CloseChannel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloseChannel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.closeChannel()';
}


}




/// @nodoc


class _SendMessage implements ChatEvent {
   _SendMessage(this.message, this.chatId);
  

 final  String message;
 final  String? chatId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageCopyWith<_SendMessage> get copyWith => __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessage&&(identical(other.message, message) || other.message == message)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,message,chatId);

@override
String toString() {
  return 'ChatEvent.sendMessage(message: $message, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(_SendMessage value, $Res Function(_SendMessage) _then) = __$SendMessageCopyWithImpl;
@useResult
$Res call({
 String message, String? chatId
});




}
/// @nodoc
class __$SendMessageCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(this._self, this._then);

  final _SendMessage _self;
  final $Res Function(_SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? chatId = freezed,}) {
  return _then(_SendMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ClearMessages implements ChatEvent {
   _ClearMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.clearMessages()';
}


}




/// @nodoc
mixin _$ChatState {

 Status get status; List<ChatEntity>? get chats; ChatEntity? get chat; String? get message; List<MessageEntity> get messageEntities;// Stores final messages
 String get typingMessage;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.chats, chats)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.messageEntities, messageEntities)&&(identical(other.typingMessage, typingMessage) || other.typingMessage == typingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(chats),chat,message,const DeepCollectionEquality().hash(messageEntities),typingMessage);

@override
String toString() {
  return 'ChatState(status: $status, chats: $chats, chat: $chat, message: $message, messageEntities: $messageEntities, typingMessage: $typingMessage)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 Status status, List<ChatEntity>? chats, ChatEntity? chat, String? message, List<MessageEntity> messageEntities, String typingMessage
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? chats = freezed,Object? chat = freezed,Object? message = freezed,Object? messageEntities = null,Object? typingMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,chats: freezed == chats ? _self.chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatEntity>?,chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as ChatEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageEntities: null == messageEntities ? _self.messageEntities : messageEntities // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,typingMessage: null == typingMessage ? _self.typingMessage : typingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ChatState implements ChatState {
   _ChatState({this.status = Status.Initial, final  List<ChatEntity>? chats, this.chat, this.message, final  List<MessageEntity> messageEntities = const [], this.typingMessage = ""}): _chats = chats,_messageEntities = messageEntities;
  

@override@JsonKey() final  Status status;
 final  List<ChatEntity>? _chats;
@override List<ChatEntity>? get chats {
  final value = _chats;
  if (value == null) return null;
  if (_chats is EqualUnmodifiableListView) return _chats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ChatEntity? chat;
@override final  String? message;
 final  List<MessageEntity> _messageEntities;
@override@JsonKey() List<MessageEntity> get messageEntities {
  if (_messageEntities is EqualUnmodifiableListView) return _messageEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messageEntities);
}

// Stores final messages
@override@JsonKey() final  String typingMessage;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._chats, _chats)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._messageEntities, _messageEntities)&&(identical(other.typingMessage, typingMessage) || other.typingMessage == typingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_chats),chat,message,const DeepCollectionEquality().hash(_messageEntities),typingMessage);

@override
String toString() {
  return 'ChatState(status: $status, chats: $chats, chat: $chat, message: $message, messageEntities: $messageEntities, typingMessage: $typingMessage)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, List<ChatEntity>? chats, ChatEntity? chat, String? message, List<MessageEntity> messageEntities, String typingMessage
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? chats = freezed,Object? chat = freezed,Object? message = freezed,Object? messageEntities = null,Object? typingMessage = null,}) {
  return _then(_ChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,chats: freezed == chats ? _self._chats : chats // ignore: cast_nullable_to_non_nullable
as List<ChatEntity>?,chat: freezed == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as ChatEntity?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageEntities: null == messageEntities ? _self._messageEntities : messageEntities // ignore: cast_nullable_to_non_nullable
as List<MessageEntity>,typingMessage: null == typingMessage ? _self.typingMessage : typingMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
