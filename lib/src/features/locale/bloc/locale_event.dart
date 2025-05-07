part of 'locale_bloc.dart';

@immutable
sealed class LocaleEvent {}

final class GetLanguage extends LocaleEvent {}

final class SetLanguage extends LocaleEvent {
  SetLanguage({required this.locale});

  final String locale;
}
