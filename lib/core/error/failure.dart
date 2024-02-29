// An abstract class to handle all failures
abstract class Failure {
  final String message;

  Failure(this.message);
}

class DataFailure extends Failure {
  DataFailure(super.message);
}
