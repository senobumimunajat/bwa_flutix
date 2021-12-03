part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(modelsUser.User user) async {
    userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<modelsUser.User> getUser(String id) async {
    DocumentSnapshot snapshot = await userCollection.doc(id).get();

    return modelsUser.User(
      id,
      snapshot.data()['email'],
      balance: snapshot.data()['balance'],
      profilePicture: snapshot.data()['profilePicture'],
      selectedGenres: (snapshot.data()['selectedGenres'] as List)
      .map((e) => e.toString())
      .toList(),
      selectedLanguage: snapshot.data()['selectedLanguage'],
      name: snapshot.data()['name']
    );
  }
}
