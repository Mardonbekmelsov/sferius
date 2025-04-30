part of 'user_bloc.dart';

@freezed
 abstract class UserEvent with _$UserEvent {
  factory UserEvent.getUser(AuthenticateBloc authenticateBloc) = _getUser;
}
