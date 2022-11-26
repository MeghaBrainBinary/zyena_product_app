import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextFormField appTextField(
    {TextEditingController? controller,
    Widget? prefixIcon,
    String? hintText,
    TextStyle? hintStyle}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: Get.width * 0.05),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: hintStyle,
    ),
  );
}
