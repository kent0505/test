part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeActivities extends HomeState {}

class HomeSettings extends HomeState {}
