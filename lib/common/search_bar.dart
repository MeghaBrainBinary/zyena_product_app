import 'package:flutter/material.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/screen/order_screen/order_controller.dart';
import 'package:product_app/utils/app_text_field.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

OrderController orderController = Get.put(OrderController());

Widget searchBar(
    {required String title,
    required Rx<TextEditingController> controller,
    String? hintText}) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
              height: Get.height / 4.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    ColorRes.skyBlue,
                    const Color(0xFF8C8CB6),
                  ]))),
          Container(
              width: Get.width,
              decoration: const BoxDecoration(color: Colors.white))
        ],
      ),
      Column(
        children: [
          sizedBoxHeight(height: 0.1),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offNamedUntil(AppRoutes.homePage, (route) => false);
                },
                child: Image.asset(
                  AssetRes.homeIcon,
                  height: 20,
                ),
              ),
              sizedBoxWidth(width: 0.15),
              Text(
                title,
                style: appTextStyle(
                    color: ColorRes.white,
                    fontSize: 24,
                    weight: FontWeight.w500),
              ),
            ],
          ),
          sizedBoxHeight(height: 0.005),
          Container(
            width: Get.width,
            height: Get.height * 0.08,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.3))
                ]),
            child: Obx(
              () => appTextField(
                onChanged: (val) async {
                  orderController.val.value = val;
                },
                controller: controller.value,
                prefixIcon: Transform.scale(
                    scale: 0.5, child: Image.asset(AssetRes.searchIcon)),
                hintText: (hintText == null) ? StringRes.searchOrder : hintText,
                hintStyle: appTextStyle(
                    color: ColorRes.skyBlue,
                    fontSize: 13,
                    weight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
