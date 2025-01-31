part of 'test_bloc.dart';

@immutable
sealed class TestEvent {}

class GetTest extends TestEvent {}

class AddTest extends TestEvent {
  AddTest({required this.model});

  final TestModel model;
}

class EditTest extends TestEvent {
  EditTest({required this.model});

  final TestModel model;
}

class DeleteTest extends TestEvent {
  DeleteTest({required this.model});

  final TestModel model;
}
