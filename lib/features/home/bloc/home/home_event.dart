part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadDataEvent extends HomeEvent {
  final String departure;
  final String destination;
  final String date;
  LoadDataEvent(
    this.departure,
    this.destination,
    this.date,
  );
}
