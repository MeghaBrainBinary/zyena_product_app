import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/common/snackbar.dart';
import 'package:product_app/globals/global.dart';
import 'package:product_app/helpers/prefkeys.dart';
import 'package:product_app/helpers/prefs.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/string_res.dart';

class SigInController extends GetxController implements GetxService {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  String errorEmail = "";
  String errorPassword = "";
  RxBool loader = false.obs;

  emailValidator() {
    if (emailController.value.text == "") {
      errorEmail = StringRes.emailE;
    } else if (emailController.value.text.isEmail == false) {
      errorEmail = StringRes.emailValidE;
    } else {
      errorEmail = "";
    }
  }

  passwordValidation() {
    if (passwordController.value.text == "") {
      errorPassword = StringRes.passwordE;
    } else {
      errorPassword = "";
    }
  }

  validator() {
    emailValidator();
    passwordValidation();

    if (errorEmail == "" && errorPassword == "") {
      return true;
    }
    return false;
  }

  signInOnTap() async {
    if (validator()) {
      try {
        loader.value = true;
        UserCredential? user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.value.text,
                password: passwordController.value.text);
        if (user.user!.uid.isNotEmpty) {
          loader.value = false;
          snakBar(title: StringRes.success, text: "Login Successful");

          PrefService.setValue(PrefKeys.uid, user.user!.uid.toString());
          if (kDebugMode) {
            print("uid ${user.user!.uid}");
          }
          Global.uid = user.user!.uid;
          if (kDebugMode) {
            print("global uid ${Global.uid}");
          }

          Get.offNamedUntil(AppRoutes.homePage, (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        loader.value = false;

        if (e.code == "wrong-password") {
          snakBar(title: StringRes.error, text: "Wrong Password");
        }
        if (e.code == 'user-not-found') {
          snakBar(
            title: StringRes.error,
            text: 'No user found for that email.',
          );
        }
        return e.toString();
      }
    } else {
      if (errorEmail != "") {
        snakBar(title: StringRes.error, text: errorEmail);
      } else if (errorPassword != "") {
        snakBar(title: StringRes.error, text: errorPassword);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      Get.offNamedUntil(AppRoutes.sigInPage, (route) => false);
    });
  }
}
