part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = ref.putFile(image);
  TaskSnapshot taskSnapshot = await uploadTask;

  return await taskSnapshot.ref.getDownloadURL();
}
