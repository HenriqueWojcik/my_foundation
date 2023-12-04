import '../../entities/failure.dart';

abstract class ErrorHandler {
  Failure? handleError(Exception e);
}
