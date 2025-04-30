part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUserEvent extends LoginEvent {
  final AuthenticateBloc authenticateBloc;
  const LoginUserEvent({required this.authenticateBloc});
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
