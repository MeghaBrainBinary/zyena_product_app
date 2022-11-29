import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/screen/signup_screen/signup_controller.dart';
import 'package:product_app/utils/app_text_field.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

SignupController signUpController = Get.put(SignupController());

Widget signupForeGround() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: const Alignment(0, 1.04),
        children: [
          Container(
            width: Get.width,
            height: Get.height / 1.48,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3))
                ]),
            child: Column(
              children: [
                sizedBoxHeight(height: 0.05),
                Text(
                  StringRes.signup,
                  style: appTextStyle(
                      color: ColorRes.skyBlue,
                      fontSize: 28,
                      weight: FontWeight.w500),
                ),
                sizedBoxHeight(height: 0.05),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: Get.width * 0.01),
                  height: Get.height * 0.08,
                  width: Get.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorRes.colorBEBEBE),
                  ),
                  child: appTextField(
                    controller: signUpController.nameController.value,
                    hintStyle: appTextStyle(
                        color: ColorRes.colorBEBEBE,
                        fontSize: 13,
                        weight: FontWeight.w400),
                    hintText: StringRes.userName,
                    prefixIcon: SizedBox(
                      height: 50,
                      width: 60,
                      child: Transform.scale(
                        scale: 0.4,
                        child: Image.asset(
                          AssetRes.userIcon,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight(height: 0.03),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: Get.width * 0.01),
                  height: Get.height * 0.08,
                  width: Get.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorRes.colorBEBEBE),
                  ),
                  child: appTextField(
                    controller: signUpController.emailController.value,
                    hintStyle: appTextStyle(
                        color: ColorRes.colorBEBEBE,
                        fontSize: 13,
                        weight: FontWeight.w400),
                    hintText: StringRes.emailOrMobileNumber,
                    prefixIcon: SizedBox(
                      height: 50,
                      width: 60,
                      child: Transform.scale(
                        scale: 0.4,
                        child: Image.asset(
                          AssetRes.emailIcon,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight(height: 0.03),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: Get.width * 0.01),
                  height: Get.height * 0.08,
                  width: Get.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorRes.colorBEBEBE),
                  ),
                  child: appTextField(
                    obscureText: true,
                    controller: signUpController.passwordController.value,
                    hintStyle: appTextStyle(
                        color: ColorRes.colorBEBEBE,
                        fontSize: 13,
                        weight: FontWeight.w400),
                    hintText: StringRes.password,
                    prefixIcon: SizedBox(
                      height: 50,
                      width: 60,
                      child: Transform.scale(
                        scale: 0.4,
                        child: Image.asset(
                          AssetRes.lockIcon,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight(height: 0.03),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: Get.width * 0.01),
                  height: Get.height * 0.08,
                  width: Get.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorRes.colorBEBEBE),
                  ),
                  child: appTextField(
                    obscureText: true,
                    controller:
                        signUpController.confirmPasswordController.value,
                    hintStyle: appTextStyle(
                        color: ColorRes.colorBEBEBE,
                        fontSize: 13,
                        weight: FontWeight.w400),
                    hintText: StringRes.confirmPassword,
                    prefixIcon: SizedBox(
                      height: 50,
                      width: 60,
                      child: Transform.scale(
                        scale: 0.4,
                        child: Image.asset(
                          AssetRes.lockIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          button(text: StringRes.signup, onTap: signUpController.signUpOnTap),
        ],
      ),
      sizedBoxHeight(height: 0.05),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${StringRes.alredyHaveAnAccount} ",
              style: appTextStyle(
                  color: ColorRes.colorBEBEBE,
                  fontSize: 13,
                  weight: FontWeight.w400),
            ),
            TextSpan(
              text: StringRes.signinSmall,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offNamedUntil(AppRoutes.sigInPage, (route) => false);
                },
              style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  color: ColorRes.skyBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ],
  );
}
