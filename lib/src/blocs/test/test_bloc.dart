import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEvent>(
      (event, emit) => switch (event) {
        GetTest() => _getTest(event, emit),
        AddTest() => _addTest(event, emit),
        EditTest() => _editTest(event, emit),
        DeleteTest() => _deleteTest(event, emit),
      },
    );
  }

  void _getTest(
    GetTest event,
    Emitter<TestState> emit,
  ) async {
    emit(TestLoading());
    await initDB();
    await getModels();
    emit(TestLoaded(models: modelsList));
  }

  void _addTest(
    AddTest event,
    Emitter<TestState> emit,
  ) async {
    emit(TestLoading());
    modelsList.insert(0, event.model);
    // modelsList.add(event.model);
    await updateModels();
    emit(TestLoaded(models: modelsList));
  }

  void _editTest(
    EditTest event,
    Emitter<TestState> emit,
  ) async {
    emit(TestLoading());
    for (TestModel model in modelsList) {
      if (identical(model.id, event.model.id)) {
        model.title = event.model.title;
      }
    }
    await updateModels();
    emit(TestLoaded(models: modelsList));
  }

  void _deleteTest(
    DeleteTest event,
    Emitter<TestState> emit,
  ) async {
    emit(TestLoading());
    modelsList.removeWhere((model) => identical(model, event.model));
    await updateModels();
    emit(TestLoaded(models: modelsList));
  }
}
