import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/screen/signin_screen/sigin_controller.dart';
import 'package:product_app/screen/signin_screen/widgets/signin_background.dart';
import 'package:product_app/screen/signin_screen/widgets/signin_foreground.dart';

class SignInScreen extends StatelessWidget {
  final SigInController signInController = Get.put(SigInController());

  SignInScreen({super.key});

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
                  signinBackGround(),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Obx(
                          () => signinForeGround(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Obx(
                () => (signInController.loader.value)
                    ? const Center(
                        child: SmallLoader(),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
