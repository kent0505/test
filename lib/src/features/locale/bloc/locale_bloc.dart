import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/locale_repository.dart';

part 'locale_event.dart';

class LocaleBloc extends Bloc<LocaleEvent, Locale> {
  final LocaleRepository _repository;

  LocaleBloc({required LocaleRepository repository})
      : _repository = repository,
        super(Locale(PlatformDispatcher.instance.locale.languageCode)) {
    on<LocaleEvent>(
      (event, emit) => switch (event) {
        GetLanguage() => _getLanguage(event, emit),
        SetLanguage() => _setLanguage(event, emit),
      },
    );
  }

  void _getLanguage(
    GetLanguage event,
    Emitter<Locale> emit,
  ) {
    final locale = _repository.getLocale();
    emit(Locale(locale));
  }

  void _setLanguage(
    SetLanguage event,
    Emitter<Locale> emit,
  ) async {
    await _repository.setLocale(event.locale);
    add(GetLanguage());
  }
}
