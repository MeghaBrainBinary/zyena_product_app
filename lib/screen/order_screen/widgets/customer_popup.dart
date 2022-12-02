import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/utils/string_res.dart';

popup(
    {required BuildContext context,
    required String title,
    required String hintText,
    required TextEditingController controller,
    required VoidCallback onTap}) {
  showDialog(
    barrierDismissible: false,
    barrierColor: ColorRes.black.withOpacity(0.65),
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsPadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        actionsAlignment: MainAxisAlignment.center,
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print("tapped........");
                        }
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        // color: Colors.blue,
                        child: Icon(
                          Icons.close,
                          color: ColorRes.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: const Alignment(0, 1.3),
                  children: [
                    Container(
                      height: Get.height / 3.5,
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 0.5,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.3))
                          ]),
                      child: Column(
                        children: [
                          sizedBoxHeight(height: 0.03),
                          Text(
                            "${StringRes.add} ${StringRes.customerName.toString().split(" ")[0]}",
                            style: appTextStyle(
                                color: ColorRes.skyBlue,
                                fontSize: 20,
                                weight: FontWeight.w500),
                          ),
                          sizedBoxHeight(height: 0.03),
                          titleWithTextField(
                              title: title,
                              hintText: hintText,
                              controller: controller),
                          // sizedBoxHeight(height: 0.05),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                      width: Get.width * 0.5,
                      child: button(
                        text: StringRes.update,
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Obx(
              () => (newOrderController.load.value)
                  ? const Center(child: SmallLoader())
                  : const SizedBox(),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: Get.height * 0.07,
              width: Get.width * 0.5,
              color: Colors.transparent,
            ),
          ),
        ],
      );
    }),
  );
}
