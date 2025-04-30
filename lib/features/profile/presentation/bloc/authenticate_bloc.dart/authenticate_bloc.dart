import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_event.dart';
import 'package:sferius_ai/features/profile/presentation/bloc/authenticate_bloc.dart/authenticate_state.dart';
import 'package:sferius_ai/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc() : super(UnAuthenticated()) {
    on<CheckAuthenticate>(_onCheck);
  }

  Future<void> _onCheck(CheckAuthenticate event, emit) async {
    log('enter token check');
    final sharedPreferences = await SharedPreferences.getInstance();

    final localConfig = sl<LocalConfig>();

    final token = await localConfig.getToken();

    log(token.toString());

    if (token == null) {
      emit(UnAuthenticated());
    } else {
      emit(Authenticated());
    }
  }
}
