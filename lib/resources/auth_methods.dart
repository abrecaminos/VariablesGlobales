import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required File file,
  }) async {
    String res = 'Some error ocurred';

    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty
          // ||file != null
          ) {
        //With this, I create the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //With this, I upload the pic and get the url at the same time
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePic', file, false);

        //Here I upload everything to the firestore
        _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'photoURL': photoURL,
          'followes': [],
          'following': []
        });
      }
      res = 'User created sucesfully';

      print('llegamos aca');
    }

    //different errores we can get from Firebase, its cool
    on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = 'The email has an invalid format';
      } else if (error.code == "invalid-email") {
        res = 'the password is weak';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
