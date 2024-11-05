part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ChangePageEvent extends HomeEvent {
  ChangePageEvent({required this.index});

  final int index;
}
