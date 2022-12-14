import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:product_app/app/common/button.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/screen/signin_screen/sigin_controller.dart';
import 'package:product_app/app/utils/app_text_field.dart';
import 'package:product_app/app/utils/approutes.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/asset_res.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

final SigInController signInController = Get.put(SigInController());

Widget signinForeGround() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: const Alignment(0, 1.04),
        children: [
          Container(
            width: Get.width,
            height: Get.height / 2.1,
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
                  StringRes.signin,
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
                    controller: signInController.emailController.value,
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
                    controller: signInController.passwordController.value,
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
              ],
            ),
          ),
          button(text: StringRes.login, onTap: signInController.signInOnTap),
        ],
      ),
      // sizedBoxHeight(height: 0.05),
      // RichText(
      //   text: TextSpan(
      //     children: [
      //       TextSpan(
      //         text: "${StringRes.dontHaveAnAccount} ",
      //         style: appTextStyle(
      //             color: ColorRes.colorBEBEBE,
      //             fontSize: 13,
      //             weight: FontWeight.w400),
      //       ),
      //       TextSpan(
      //         text: StringRes.signupSmall,
      //         recognizer: TapGestureRecognizer()
      //           ..onTap = () {
      //             Get.offNamedUntil(AppRoutes.signupPage, (route) => false);
      //           },
      //         style: GoogleFonts.poppins(
      //             decoration: TextDecoration.underline,
      //             color: ColorRes.skyBlue,
      //             fontSize: 13,
      //             fontWeight: FontWeight.w400),
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}
