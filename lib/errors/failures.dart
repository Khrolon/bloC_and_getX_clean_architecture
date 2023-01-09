abstract class Failure implements Exception {
  Future<String> errorMessage();
}

class UserFailure extends Failure {
  @override
  Future<String> errorMessage() async {
    throw Exception('Login error');
  }
}
