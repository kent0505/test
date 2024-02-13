part of 'date_bloc.dart';

abstract class DateState {}

class DateInitial extends DateState {}

class DatePickedState extends DateState {
  final String date;
  DatePickedState(this.date);
}
