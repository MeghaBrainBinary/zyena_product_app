import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/utils/color_res.dart';

TextFormField appTextField(
    {TextEditingController? controller,
    bool? obscureText,
    bool? enabled,
    Widget? prefixIcon,
    TextInputType? keyboardType,
    String? hintText,
    TextStyle? style,
    void Function(String)? onChanged,
    TextStyle? hintStyle}) {
  return TextFormField(
    onChanged: onChanged,
    style: style ?? TextStyle(color: ColorRes.black),
    enabled: enabled ?? true,
    obscureText: obscureText ?? false,
    keyboardType: keyboardType ?? TextInputType.text,
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
