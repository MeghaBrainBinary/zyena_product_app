import 'package:flutter/material.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/utils/app_text_field.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:get/get.dart';

Widget titleWithTextField(
    {required String title,
    required String hintText,
    required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: appTextStyle(
            color: ColorRes.skyBlue, fontSize: 15, weight: FontWeight.w500),
      ),
      sizedBoxHeight(height: 0.02),
      Container(
        height: Get.height * 0.055,
        decoration: BoxDecoration(
          border: Border.all(color: ColorRes.skyBlue, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: appTextField(
            controller: controller,
            hintText: hintText,
            hintStyle: appTextStyle(
                color: ColorRes.skyBlue,
                fontSize: 13,
                weight: FontWeight.w300)),
      ),
    ],
  );
}
