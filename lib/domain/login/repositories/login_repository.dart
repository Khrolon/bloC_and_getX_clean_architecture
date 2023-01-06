abstract class LoginRepository {
  forgothPassword();
  Future<bool> userLogin(String email, String password);
  Future<bool> googleLogin();
  createUser();
}
