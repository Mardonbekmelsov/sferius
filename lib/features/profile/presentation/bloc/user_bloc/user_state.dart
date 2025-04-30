part of 'user_bloc.dart';


@freezed
abstract class UserState with _$UserState {
  factory UserState({
    @Default(Status.Loading) Status status,
    @Default(AuthStatus.Unauthenticated) AuthStatus authStatus,
    String? message,
    UserMeEntity? user,
  }) = _UserState;
}