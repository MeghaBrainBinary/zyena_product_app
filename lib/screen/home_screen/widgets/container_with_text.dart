import 'package:flutter/material.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:get/get.dart';

Widget containerWithText(
    {required String image, required String text, VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: Get.height * 0.1,
      width: Get.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              image,
            ),
          ),
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
