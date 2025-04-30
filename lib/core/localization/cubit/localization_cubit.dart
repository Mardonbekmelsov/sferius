import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sferius_ai/core/config/local_config.dart';
import 'package:sferius_ai/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit({required this.localConfig})
      : super(
          _getSystemLocale(),
        );

  LocalConfig localConfig;

  static Locale _getSystemLocale() {
    return PlatformDispatcher.instance.locale;
  }

  Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('language_code');

    if (langCode == null) {
      emit(_getSystemLocale());
    } else {
      emit(Locale(langCode));
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    S.load(locale);
    await prefs.setString('language_code', locale.languageCode);
    emit(locale);
  }
}
