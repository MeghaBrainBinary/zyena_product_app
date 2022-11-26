import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:product_app/screen/signin_screen/sigin_controller.dart';
import 'package:product_app/screen/singup_screen/sinup_controller.dart';
import 'package:product_app/utils/app_text_field.dart';
import 'package:product_app/utils/approutes.dart';

import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signUpController = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      height: Get.height / 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            ColorRes.skyBlue,
                            const Color(0xFF8C8CB6),
                          ]))),
                  Container(
                      height: Get.height / 2,
                      decoration: const BoxDecoration(color: Colors.white))
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: const Alignment(0, 1.06),
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height / 1.7,
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
                                    padding:
                                        EdgeInsets.only(left: Get.width * 0.01),
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorRes.colorBEBEBE),
                                    ),
                                    child: appTextField(
                                      controller:
                                          signUpController.emailController,
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
                                            AssetRes.userIcon,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizedBoxHeight(height: 0.03),
                                  Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.only(left: Get.width * 0.01),
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorRes.colorBEBEBE),
                                    ),
                                    child: appTextField(
                                      controller:
                                          signUpController.passwordController,
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
                                    padding:
                                        EdgeInsets.only(left: Get.width * 0.01),
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorRes.colorBEBEBE),
                                    ),
                                    child: appTextField(
                                      controller: signUpController
                                          .confirmPasswordController,
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
                            button(
                                text: StringRes.signup,
                                onTap: signUpController.signUpOnTap),
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
                                    Get.offNamedUntil(
                                        AppRoutes.sigInPage, (route) => false);
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
