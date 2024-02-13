part of 'date_bloc.dart';

abstract class DateEvent {}

class PickDateEvent extends DateEvent {
  final String date;
  PickDateEvent(this.date);
}
