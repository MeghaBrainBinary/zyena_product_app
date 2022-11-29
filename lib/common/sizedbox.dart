import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

Widget sizedBoxHeight({required double height}) {
  return SizedBox(
    height: Get.height * height,
  );
}

Widget sizedBoxWidth({required double width}) {
  return SizedBox(
    width: Get.width * width,
  );
}

Widget sizedBox({required double height, required double width}) {
  return SizedBox(
    height: Get.height * height,
    width: Get.width * width,
  );
}
