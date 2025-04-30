// lib/features/reader/cubit/text_size_cubit.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sferius_ai/core/config/local_config.dart';

class ChatTextSizeCubit extends Cubit<double> {
  /// AppStorage kirib keladi
  final LocalConfig _appStorage;

  ChatTextSizeCubit(this._appStorage) : super(18.0) {
    /// Localdan texts size oqib olinadi
    _loadSavedTextSize();
  }

  /// Text Sizeni localdan oqib olish
  Future<void> _loadSavedTextSize() async {
    final storedSize = await _appStorage.getTextSize();

    emit(storedSize);
    log("Loaded text size: $storedSize", name: "TEXT SIZE");
  }

  /// Text Sizeni ozgartirish va uni local saqlab qoyish
  Future<void> changeSize(double newSize) async {
    if (newSize >= 12 && newSize <= 24) {
      emit(newSize);
      await _appStorage.setTextSize(newSize);
      log("Text size changed to: $newSize", name: "TEXT SIZE");
    }
  }
}
