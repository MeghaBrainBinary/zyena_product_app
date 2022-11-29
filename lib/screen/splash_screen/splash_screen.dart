import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'package:product_app/screen/signin_screen/sigin_controller.dart';
import 'package:product_app/utils/asset_res.dart';

class SplashScreen extends StatelessWidget {
  final SigInController sigInController = Get.put(SigInController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: SizedBox(
            height: 200, width: 200, child: Image.asset(AssetRes.splashLogo)),
      ),
    );
  }
}
