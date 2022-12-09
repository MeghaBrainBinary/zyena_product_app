import 'package:flutter/material.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

Widget containerWithText(
    {required String image, required String text, VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // color: ColorRes.black,
      alignment: Alignment.center,
      height: Get.height * 0.1,
      width: Get.width * 0.4,
      child: Column(
        mainAxisAlignment: (image != "")
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          (image != "")
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    image,
                  ),
                )
              : const SizedBox(),
          Text(
            text,
            style: appTextStyle(
                color: ColorRes.skyBlue, fontSize: 15, weight: FontWeight.w400),
          )
        ],
      ),
    ),
  );
}
