import 'models/trip.dart';

abstract class Result {}

class SuccessResult extends Result {
  final List<Trip> trips;
  SuccessResult(this.trips);
}

class ErrorResult extends Result {
  final String message;
  final int status;
  ErrorResult(
    this.message,
    this.status,
  );
}

class ServerErrorResult extends Result {}
