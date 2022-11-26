import 'package:flutter/material.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:get/get.dart';

Widget signupBackGround() {
  return Column(
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
  );
}