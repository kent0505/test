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

    // on<GetTestsEvent>((event, emit) async {
    //   await getModels();
    //   emit(TestLoadedState(model: DB.modelsList));
    // });

    // on<AddTestEvent>((event, emit) async {
    //   DB.modelsList.insert(0, event.model);
    //   // DB.modelsList.add(event.model);
    //   await updateModels();
    //   emit(ModelLoadedState(model: DB.modelsList));
    // });

    // on<EditTestEvent>((event, emit) async {
    //   for (Model model in DB.modelsList) {
    //     if (model.id == event.model.id) {
    //       model.title = event.model.title;
    //       model.amount = event.model.amount;
    //       model.category = event.model.category;
    //     }
    //   }
    //   await updateModels();
    //   emit(ModelLoadedState(model: DB.modelsList));
    // });

    // on<DeleteTestEvent>((event, emit) async {
    //   DB.modelsList.removeWhere((element) => element.id == event.id);
    //   await updateModels();
    //   emit(ModelLoadedState(model: DB.modelsList));
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
      List<TestModel> models = await _database.addModel(event.model);
      emit(TestLoaded(models: models));
    } on Object catch (_) {}
  }

  void _editTest(
    EditTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      List<TestModel> models = await _database.editModel(event.model);
      emit(TestLoaded(models: models));
    } on Object catch (_) {}
  }

  void _deleteTest(
    DeleteTest event,
    Emitter<TestState> emit,
  ) async {
    try {
      List<TestModel> modelsList = await _database.deleteModel(event.model);
      emit(TestLoaded(models: modelsList));
    } on Object catch (_) {}
  }
}
