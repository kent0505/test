part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

class InternetInitial extends InternetState {}

class InternetSuccess extends InternetState {}

class InternetFailure extends InternetState {}
