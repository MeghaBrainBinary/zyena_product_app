import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/screen/signup_screen/signup_controller.dart';
import 'package:product_app/screen/signup_screen/widgets/signup_background.dart';
import 'package:product_app/screen/signup_screen/widgets/signup_foreground.dart';

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
              Stack(
                children: [
                  signupBackGround(),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Obx(
                          () => signupForeGround(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Obx(
                () => (signUpController.loader.value)
                    ? const SmallLoader()
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
