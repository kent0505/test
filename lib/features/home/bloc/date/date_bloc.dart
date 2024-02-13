import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateInitial()) {
    on<PickDateEvent>((event, emit) {
      emit(DatePickedState(event.date));
    });
  }
}
