// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/core/constants/app_constants.dart';
import 'package:sferius_ai/core/error/failure.dart';
import 'package:sferius_ai/features/profile/domain/entities/user_me_entity.dart';
import 'package:sferius_ai/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_bloc.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  LocalConfig localConfig;
  GetUserUsecase getUserUsecase;

  UserBloc({required this.getUserUsecase, required this.localConfig})
    : super(UserState(status: Status.Initial)) {
    on<_getUser>(_onGetUser);
  }

  Future<void> _onGetUser(_getUser event, emit) async {
    log('enter user bloc');
    emit(state.copyWith(status: Status.Loading));
    try {
      final response = await getUserUsecase.call(null);
      print(response);
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
          log('success in user');
          emit(state.copyWith(user: data, status: Status.Success));
        },
      );
    } catch (e) {
      log('user bloc error: ${e.toString()}');
    }
  }

  String _failureMessage(Failure failure) {
    switch (failure) {
      case ServerFailure():
        return "Server Exception";
      default:
        return "Smth get wrong";
    }
  }
}
