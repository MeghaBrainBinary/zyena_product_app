// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/globals/global.dart';
import 'package:product_app/helpers/prefkeys.dart';
import 'package:product_app/helpers/prefs.dart';
import 'package:product_app/model/product_model.dart';
import 'package:product_app/model/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/utils/firestore_collections.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class UserService {
  CollectionReference users =
      FirebaseFirestore.instance.collection(FireStoreCollections.users);

  /// add user data in firebase
  Future<void> createUser(UserModel userModel) async {
    try {
      await users.doc(userModel.uid).set(userModel.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  /// add new order data in firebase
  Future<void> addNewOrder(NewOrderModel newOrderModel) async {
    try {
      await users
          .doc(Global.uid)
          .collection(FireStoreCollections.newOrder)
          .add(newOrderModel.toMap());
    } catch (e) {
      throw e.toString();
    }
  }
}

/// singleton class
class FirebaseHelper {
  FirebaseHelper._();
  static final FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference users =
      FirebaseFirestore.instance.collection(FireStoreCollections.users);

  /// add new order data in firebase
  Future<void> addNewOrder(NewOrderModel newOrderModel) async {
    try {
      await users
          .doc(PrefService.getString(PrefKeys.uid).toString())
          .collection("New Order")
          .add(newOrderModel.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> addNewOrder2(Map<String, dynamic> map) async {
    try {
      await users.doc(Global.uid).collection("NewOrder").add(map);
    } catch (e) {
      throw e.toString();
    }
  }
}
