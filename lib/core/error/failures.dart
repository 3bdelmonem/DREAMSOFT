import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

String failureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case EmptyCacheFailure:
      return "Sorry, There is no data";
    default:
      return "Unexpected Error please try again later";
  }
}