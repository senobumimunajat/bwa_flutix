part of 'extensions.dart';

extension FirebaseUserExtension on firebaseAuth.User {
  convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      modelsUser.User(uid, email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<modelsUser.User> fromFireStore() async =>
      await UserServices.getUser(uid);
}
