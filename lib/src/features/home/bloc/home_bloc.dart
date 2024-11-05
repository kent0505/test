import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        ChangePageEvent() => _changePage(event, emit),
      },
    );
  }

  void _changePage(
    ChangePageEvent event,
    Emitter<HomeState> emit,
  ) {
    if (event.index == 0 && state is! HomeInitial) emit(HomeInitial());
    if (event.index == 1 && state is! HomeActivities) emit(HomeActivities());
    if (event.index == 2 && state is! HomeSettings) emit(HomeSettings());
  }
}
