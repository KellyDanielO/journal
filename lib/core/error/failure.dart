abstract class Failure {
  final String message;

  Failure(this.message);
}

class DataFailure extends Failure {
  DataFailure(super.message);
}
