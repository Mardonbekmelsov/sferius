// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEvent {

 AuthenticateBloc get authenticateBloc;
/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEventCopyWith<UserEvent> get copyWith => _$UserEventCopyWithImpl<UserEvent>(this as UserEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEvent&&(identical(other.authenticateBloc, authenticateBloc) || other.authenticateBloc == authenticateBloc));
}


@override
int get hashCode => Object.hash(runtimeType,authenticateBloc);

@override
String toString() {
  return 'UserEvent(authenticateBloc: $authenticateBloc)';
}


}

/// @nodoc
abstract mixin class $UserEventCopyWith<$Res>  {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) _then) = _$UserEventCopyWithImpl;
@useResult
$Res call({
 AuthenticateBloc authenticateBloc
});




}
/// @nodoc
class _$UserEventCopyWithImpl<$Res>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._self, this._then);

  final UserEvent _self;
  final $Res Function(UserEvent) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authenticateBloc = null,}) {
  return _then(_self.copyWith(
authenticateBloc: null == authenticateBloc ? _self.authenticateBloc : authenticateBloc // ignore: cast_nullable_to_non_nullable
as AuthenticateBloc,
  ));
}

}


/// @nodoc


class _getUser implements UserEvent {
   _getUser(this.authenticateBloc);
  

@override final  AuthenticateBloc authenticateBloc;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$getUserCopyWith<_getUser> get copyWith => __$getUserCopyWithImpl<_getUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getUser&&(identical(other.authenticateBloc, authenticateBloc) || other.authenticateBloc == authenticateBloc));
}


@override
int get hashCode => Object.hash(runtimeType,authenticateBloc);

@override
String toString() {
  return 'UserEvent.getUser(authenticateBloc: $authenticateBloc)';
}


}

/// @nodoc
abstract mixin class _$getUserCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory _$getUserCopyWith(_getUser value, $Res Function(_getUser) _then) = __$getUserCopyWithImpl;
@override @useResult
$Res call({
 AuthenticateBloc authenticateBloc
});




}
/// @nodoc
class __$getUserCopyWithImpl<$Res>
    implements _$getUserCopyWith<$Res> {
  __$getUserCopyWithImpl(this._self, this._then);

  final _getUser _self;
  final $Res Function(_getUser) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authenticateBloc = null,}) {
  return _then(_getUser(
null == authenticateBloc ? _self.authenticateBloc : authenticateBloc // ignore: cast_nullable_to_non_nullable
as AuthenticateBloc,
  ));
}


}

/// @nodoc
mixin _$UserState {

 Status get status; AuthStatus get authStatus; String? get message; UserMeEntity? get user;
/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateCopyWith<UserState> get copyWith => _$UserStateCopyWithImpl<UserState>(this as UserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState&&(identical(other.status, status) || other.status == status)&&(identical(other.authStatus, authStatus) || other.authStatus == authStatus)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,authStatus,message,user);

@override
String toString() {
  return 'UserState(status: $status, authStatus: $authStatus, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $UserStateCopyWith<$Res>  {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) _then) = _$UserStateCopyWithImpl;
@useResult
$Res call({
 Status status, AuthStatus authStatus, String? message, UserMeEntity? user
});




}
/// @nodoc
class _$UserStateCopyWithImpl<$Res>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._self, this._then);

  final UserState _self;
  final $Res Function(UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? authStatus = null,Object? message = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,authStatus: null == authStatus ? _self.authStatus : authStatus // ignore: cast_nullable_to_non_nullable
as AuthStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserMeEntity?,
  ));
}

}


/// @nodoc


class _UserState implements UserState {
   _UserState({this.status = Status.Loading, this.authStatus = AuthStatus.Unauthenticated, this.message, this.user});
  

@override@JsonKey() final  Status status;
@override@JsonKey() final  AuthStatus authStatus;
@override final  String? message;
@override final  UserMeEntity? user;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStateCopyWith<_UserState> get copyWith => __$UserStateCopyWithImpl<_UserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserState&&(identical(other.status, status) || other.status == status)&&(identical(other.authStatus, authStatus) || other.authStatus == authStatus)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,status,authStatus,message,user);

@override
String toString() {
  return 'UserState(status: $status, authStatus: $authStatus, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(_UserState value, $Res Function(_UserState) _then) = __$UserStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, AuthStatus authStatus, String? message, UserMeEntity? user
});




}
/// @nodoc
class __$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(this._self, this._then);

  final _UserState _self;
  final $Res Function(_UserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? authStatus = null,Object? message = freezed,Object? user = freezed,}) {
  return _then(_UserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,authStatus: null == authStatus ? _self.authStatus : authStatus // ignore: cast_nullable_to_non_nullable
as AuthStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserMeEntity?,
  ));
}


}

// dart format on
