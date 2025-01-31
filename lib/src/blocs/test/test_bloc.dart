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

    // on<GetTest>((event, emit) async {
    //   await getModels();
    //   emit(TestLoaded(models: modelsList));
    // });

    // on<AddTest>((event, emit) async {
    //   modelsList.insert(0, event.model);
    //   await updateModels();
    //   emit(TestLoaded(models: modelsList));
    // });

    // on<EditTest>((event, emit) async {
    //   modelsList.singleWhere((model) => model.id == event.model.id)
    //     ..title = 'aaa'
    //     ..title = 'bbb';
    //   await updateModels();
    //   emit(TestLoaded(models: modelsList));
    // });

    // on<DeleteTest>((event, emit) async {
    //   modelsList.removeWhere((model) => model.id == event.id);
    //   await updateModels();
    //   emit(TestLoaded(models: modelsList));
    // });
  }

  void _getTest(
    GetTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await getPrefs();
      await _database.init();
      List<TestModel> models = await _database.getModels();
      emit(TestLoaded(models: models));
    } on Object catch (_) {}
  }

  void _addTest(
    AddTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.addModel(event.model);
      List<TestModel> models = await _database.getModels();
      emit(TestLoaded(models: models));
    } on Object catch (_) {}
  }

  void _editTest(
    EditTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.editModel(event.model);
      List<TestModel> models = await _database.getModels();
      emit(TestLoaded(models: models));
    } on Object catch (_) {}
  }

  void _deleteTest(
    DeleteTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      await _database.deleteModel(event.model);
      List<TestModel> modelsList = await _database.getModels();
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {}
  }
}
