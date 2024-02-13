part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Trip> trips;
  HomeLoadedState(this.trips);
}

class HomeErrorState extends HomeState {}
