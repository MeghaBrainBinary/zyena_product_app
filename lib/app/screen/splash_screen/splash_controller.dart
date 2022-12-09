import 'dart:async';
import 'package:get/get.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/utils/approutes.dart';

class SplashAppController extends GetxController implements GetxService {
  @override
  void onInit() {
    super.onInit();

    PrefService.setValue(PrefKeys.isSplash, true);
    Timer(const Duration(seconds: 3), () {
      // Get.toNamed(AppRoutes.sigInPage);
      Get.offNamed(AppRoutes.sigInPage);
    });
  }
}
