import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/utils/color_res.dart';

snakBar({required String title, required String text}) {
  Get.snackbar(title, text,
      colorText: ColorRes.white,
      backgroundColor: (title == "Error") ? Colors.redAccent : Colors.green);
}
