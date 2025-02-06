import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>(
      (event, emit) => switch (event) {
        ChangePage() => _changePage(event, emit),
      },
    );
  }

  void _changePage(
    ChangePage event,
    Emitter<NavbarState> emit,
  ) {
    if (event.index == 1) emit(NavbarInitial());
    if (event.index == 2) emit(Navbar2());
    if (event.index == 3) emit(Navbar3());
    if (event.index == 4) emit(Navbar4());
    if (event.index == 5) emit(Navbar5());
  }
}
