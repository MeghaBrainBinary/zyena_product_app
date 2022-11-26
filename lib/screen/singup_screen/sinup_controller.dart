import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/utils/app_state.dart';
import 'package:product_app/model/user_model.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/approutes.dart';

class SignupController extends GetxController implements GetxService {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  UserService userService = UserService();

  void signUpOnTap() {
    Get.offNamedUntil(AppRoutes.homePage, (route) => false);
  }

  onSignup() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential? user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (user.user!.uid.isNotEmpty) {
          Get.snackbar("Success", "Signup Successful");
          UserModel userModel = UserModel(
            name: "",
            email: emailController.text.trim(),
            profilePicture: "",
            fcmToken: "",
          );
          userModel.profilePicture = "";
          userModel.uid = user.user!.uid;
          userModel.isAdmin = false;
          appState.currentUser = userModel;
          try {
            await userService.createUser(userModel);
          } catch (e) {
            throw e.toString();
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          Get.snackbar("Error", "Email is already register");
        }
        return e.toString();
      }
    }
  }
}
