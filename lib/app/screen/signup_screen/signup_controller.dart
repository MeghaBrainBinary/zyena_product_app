import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/app/common/snackbar.dart';
import 'package:product_app/app/globals/global.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/utils/app_state.dart';
import 'package:product_app/app/model/user_model.dart';
import 'package:product_app/app/service/user_service.dart';
import 'package:product_app/app/utils/approutes.dart';
import 'package:product_app/app/utils/string_res.dart';

class SignupController extends GetxController implements GetxService {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  UserService userService = UserService();
  RxBool loader = false.obs;
  String errorName = "";
  String errorEmail = "";
  String errorPassword = "";
  String errorConfirmPassword = "";

  emailValidator() {
    if (emailController.value.text == "") {
      errorEmail = StringRes.emailE;
    } else if (emailController.value.text.isEmail == false) {
      errorEmail = StringRes.emailValidE;
    } else {
      errorEmail = "";
    }
  }

  nameValidator() {
    if (nameController.value.text == "") {
      errorName = StringRes.nameE;
    } else {
      errorName = "";
    }
  }

  passwordValidator() {
    if (passwordController.value.text == "") {
      errorPassword = StringRes.passwordE;
    } else {
      errorPassword = "";
    }
  }

  confirmPasswordValidator() {
    if (confirmPasswordController.value.text == "") {
      errorConfirmPassword = StringRes.confirmPasswordE;
    } else {
      errorConfirmPassword = "";
    }
  }

  validator() {
    nameValidator();
    emailValidator();
    passwordValidator();
    confirmPasswordValidator();

    if (errorName == "" &&
        errorEmail == "" &&
        errorPassword == "" &&
        errorConfirmPassword == "") {
      return true;
    }
    return false;
  }

  signUpOnTap() async {
    if (validator()) {
      if (passwordController.value.text ==
          confirmPasswordController.value.text) {
        try {
          loader.value = true;
          UserCredential? user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.value.text,
                  password: passwordController.value.text);
          if (user.user!.uid.isNotEmpty) {
            UserModel userModel = UserModel(
              name: nameController.value.text.trim(),
              email: emailController.value.text.trim(),
              profilePicture: "",
              fcmToken: PrefService.getString(PrefKeys.userToken),
            );
            userModel.profilePicture = "";
            userModel.uid = user.user!.uid;
            Global.uid = user.user!.uid;
            PrefService.setValue(PrefKeys.uid, user.user!.uid.toString());
            Global.username = userModel.name!;
            if (kDebugMode) {
              print("username ${userModel.name!}");
              PrefService.setValue("username", userModel.name!.toString());
            }
            userModel.isAdmin = true;
            userModel.userType = "Admin";
            appState.currentUser = userModel;

            try {
              await userService.createUser(userModel);
            } catch (e) {
              throw e.toString();
            }
            loader.value = false;

            snakBar(title: StringRes.success, text: StringRes.signupSuccessful);

            Get.offNamedUntil(AppRoutes.homePage, (route) => false);
          }
        } on FirebaseAuthException catch (e) {
          loader.value = false;

          if (e.code == "email-already-in-use") {
            snakBar(title: StringRes.error, text: "Email is already register");
          }
          if (e.code == 'weak-password') {
            snakBar(
                title: StringRes.error,
                text: 'The password provided is too weak.');
          }
          return e.toString();
        }
      } else {
        loader.value = false;

        snakBar(
            title: StringRes.error,
            text: "Password and confirm password does not match");
      }
    } else {
      loader.value = false;

      if (errorName != "") {
        snakBar(title: StringRes.error, text: errorName);
      } else if (errorEmail != "") {
        snakBar(title: StringRes.error, text: errorEmail);
      } else if (errorPassword != "") {
        snakBar(title: StringRes.error, text: errorPassword);
      } else if (errorConfirmPassword != "") {
        snakBar(title: StringRes.error, text: errorConfirmPassword);
      }
    }
  }
}
