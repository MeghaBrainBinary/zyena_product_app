import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';

Widget button({VoidCallback? onTap, required String text}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: Get.height * 0.08,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              ColorRes.skyBlue,
              ColorRes.color8C8CB6,
            ]),
      ),
      child: Text(
        text,
        style: appTextStyle(
            color: ColorRes.white, fontSize: 20, weight: FontWeight.w500),
      ),
    ),
  );
}
