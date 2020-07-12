import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radiohead/utils/constants.dart';

class FireBaseController {
  FirebaseAuth _auth_instance;
  Firestore _store_instance;

  String userUID;

  FireBaseController() {
    _auth_instance = FirebaseAuth.instance;
    _store_instance = Firestore.instance;
  }

  // Log in anonymously
  Future<bool> login() async {
    try {
      AuthResult result = await _auth_instance.signInAnonymously();
      FirebaseUser user = result.user;
      print('User logged in: ${user.uid}');
      userUID = user.uid;
      return true;
    } catch (exception) {
      print('Could not fetch user: $exception');
      return false;
    }
  }

  Future<bool> addNewUser() async {
    _store_instance.collection(Constants.COLLECTION_NAME).add({'uid': userUID});
  }
}
