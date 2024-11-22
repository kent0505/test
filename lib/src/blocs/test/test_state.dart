part of 'test_bloc.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

final class TestLoading extends TestState {}

final class TestLoaded extends TestState {
  TestLoaded({required this.models});

  final List<TestModel> models;
}
