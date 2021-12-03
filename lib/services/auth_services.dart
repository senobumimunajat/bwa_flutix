part of 'services.dart';

class AuthServices {
  static firebaseUser.FirebaseAuth _auth = firebaseUser.FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      firebaseUser.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      modelsUser.User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(']')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      firebaseUser.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      modelsUser.User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(']')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<firebaseUser.User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  modelsUser.User user;
  final String message;
  SignInSignUpResult({this.user, this.message});
}
