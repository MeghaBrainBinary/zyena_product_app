import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:product_app/screen/home_screen/home_page_controller.dart';
import 'package:product_app/utils/approutes.dart';

class SigInController extends GetxController implements GetxService {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential? user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (user.user!.uid.isNotEmpty) {
          Get.snackbar("Success", "Login Successful");
          HomePageController homePageController = Get.put(HomePageController());
          homePageController.onInit();

          Get.toNamed(AppRoutes.homePage);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          Get.snackbar("Error", "User is already register");
        }
        if (e.code == "wrong-password") {
          Get.snackbar("Error", "Wrong Password");
        }
        return e.toString();
      }
    }
  }

  void signInOnTap() {
    Get.offNamedUntil(AppRoutes.homePage, (route) => false);
  }

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      Get.offNamedUntil(AppRoutes.sigInPage, (route) => false);
    });
  }
}
