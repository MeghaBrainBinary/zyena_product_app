import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';

Widget signinSignupTextField(
    {required Widget prefixIcon, required String hintText}) {
  return Container(
    height: Get.height * 0.08,
    width: Get.width * 0.8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorRes.skyBlue),
    ),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: appTextStyle(
            color: ColorRes.colorBEBEBE, fontSize: 13, weight: FontWeight.w400),
      ),
    ),
  );
}
