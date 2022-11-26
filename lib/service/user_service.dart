import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:product_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/utils/firestore_collections.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class UserService {
  CollectionReference users =
      FirebaseFirestore.instance.collection(FireStoreCollections.users);
  Future<void> createUser(UserModel userModel) async {
    try {
      await users.doc(userModel.uid).set(userModel.toMap());
    } catch (e) {
      throw e.toString();
    }
  }
}
