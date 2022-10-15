import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String chilPathdName, File file, bool isPost) async {
    Reference reference =
        _storage.ref().child(chilPathdName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = reference.putFile(file);

    TaskSnapshot taskSnapshot = await uploadTask;

    String urlString = await taskSnapshot.ref.getDownloadURL();

    return urlString;
  }
}
