import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/db/prefs.dart';
import '../../core/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final _database = DB();

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
    try {
      await getPrefs();
      await _database.init();
      await _database.getModels();
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {
      emit(TestLoaded(models: modelsList));
    }
  }

  void _addTest(
    AddTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.addModel(event.model);
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {
      emit(TestLoaded(models: modelsList));
    }
  }

  void _editTest(
    EditTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.editModel(event.model);
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {
      emit(TestLoaded(models: modelsList));
    }
  }

  void _deleteTest(
    DeleteTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.deleteModel(event.model);
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {
      emit(TestLoaded(models: modelsList));
    }
  }
}
