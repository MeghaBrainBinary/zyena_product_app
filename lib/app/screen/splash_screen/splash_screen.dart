import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/screen/splash_screen/splash_controller.dart';
import 'package:product_app/app/utils/asset_res.dart';

class SplashAppScreen extends StatelessWidget {
  // final SigInController sigInController = Get.put(SigInController());

  SplashAppScreen({super.key});

  final SplashAppController splashAppController =
      Get.put(SplashAppController());

  @override
  Widget build(BuildContext context) {
    // sigInController.onInit();
    PrefService.setValue(PrefKeys.isSplash, true);

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(AssetRes.splashLogo),
        ),
      ),
    );
  }
}
