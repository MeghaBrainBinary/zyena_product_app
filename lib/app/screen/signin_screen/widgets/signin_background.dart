import 'package:flutter/material.dart';
import 'package:product_app/app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

Widget signinBackGround() {
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
