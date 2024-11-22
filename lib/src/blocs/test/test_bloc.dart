import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/db/prefs.dart';
import '../../core/models/test_model.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final database = DB();

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
    await getPrefs();
    await database.init();
    List<TestModel> models = await database.getModels();
    emit(TestLoaded(models: models));
  }

  void _addTest(
    AddTest event,
    Emitter<TestState> emit,
  ) async {
    List<TestModel> models = await database.addModel(event.model);
    emit(TestLoaded(models: models));
  }

  void _editTest(
    EditTest event,
    Emitter<TestState> emit,
  ) async {
    List<TestModel> models = await database.editModel(event.model);
    emit(TestLoaded(models: models));
  }

  void _deleteTest(
    DeleteTest event,
    Emitter<TestState> emit,
  ) async {
    List<TestModel> models = await database.deleteModel(event.model);
    emit(TestLoaded(models: models));
  }
}
