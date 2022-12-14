import 'package:flutter/material.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/screen/order_screen/order_controller.dart';
import 'package:product_app/app/utils/app_text_field.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/asset_res.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

OrderController orderController = Get.put(OrderController());

Widget searchBar(
    {required String title,
    required Rx<TextEditingController> controller,
    String? hintText,
    bool isSearch = true}) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
              height: Get.height / 6,
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
          (isSearch)
              ? sizedBoxHeight(height: 0.06)
              : sizedBoxHeight(height: 0.06),
          Row(
            children: [
              InkWell(
                onTap: () {
                  orderController.isService.value = false;
                  orderController.customerName.value =
                      StringRes.customerName.toLowerCase();
                  orderController.productName.value =
                      StringRes.productName.toLowerCase();
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: Image.asset(
                    AssetRes.homeIcon,
                    height: 20,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: appTextStyle(
                        color: ColorRes.white,
                        fontSize: 24,
                        weight: FontWeight.w500),
                  ),
                ),
              ),
              Visibility(
                maintainSize: true,
                visible: false,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: Image.asset(
                    AssetRes.homeIcon,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
          // sizedBoxHeight(height: 0.005),
          (isSearch)
              ? Container(
                  width: Get.width,
                  height: Get.height * 0.06,
                  margin: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 20, top: 3),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 0.5,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.3)),
                    ],
                  ),
                  child: Obx(
                    () => appTextField(
                      onChanged: (val) async {
                        orderController.val.value = val;
                      },
                      controller: controller.value,
                      prefixIcon: Transform.scale(
                          scale: 0.5, child: Image.asset(AssetRes.searchIcon)),
                      hintText:
                          (hintText == null) ? StringRes.searchOrder : hintText,
                      hintStyle: appTextStyle(
                          color: ColorRes.skyBlue,
                          fontSize: 13,
                          weight: FontWeight.w300),
                    ),
                  ),
                )
              : const SizedBox(),
          sizedBoxHeight(height: 0.005),
        ],
      ),
    ],
  );
}
