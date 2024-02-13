import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/trip.dart';
import '../../../../core/result.dart';
import '../../home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = HomeRepository();

  HomeBloc() : super(HomeInitial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(HomeLoadingState());

      Result result = await repository.fetchTrips(
        event.departure,
        event.destination,
        event.date,
      );

      if (result is SuccessResult) {
        emit(HomeLoadedState(result.trips));
      } else {
        emit(HomeErrorState());
      }
    });
  }
}
