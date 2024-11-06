part of 'button_bloc.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}

class ButtonInactive extends ButtonState {}
