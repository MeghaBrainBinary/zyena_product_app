import 'package:flutter/material.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/screen/new_order_screen/new_order_controller.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:get/get.dart';

NewOrderController newOrderController = Get.put(NewOrderController());

Widget dropDownAndPlusButtonRow({required BuildContext context}) {
  return Row(
    children: [
      Expanded(
        child: Container(
            padding: EdgeInsets.only(
              left: Get.width * 0.05,
              right: Get.width * 0.05,
            ),
            height: Get.height * 0.055,
            decoration: BoxDecoration(
              border: Border.all(color: ColorRes.skyBlue, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Obx((() => DropdownButton(
                  underline: const SizedBox(),

                  // Down Arrow Icon
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: ColorRes.skyBlue,
                  ),
                  isExpanded: true,

                  // hint text
                  hint: Text(
                    newOrderController.selectProduct.value,
                    style: appTextStyle(
                        color: ColorRes.skyBlue,
                        fontSize: 13,
                        weight: FontWeight.w300),
                  ),

                  // Array list of items
                  items: newOrderController.products.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    newOrderController.selectProduct.value = newValue!;
                  },
                )))),
      ),
      sizedBoxWidth(width: 0.05),
      InkWell(
        onTap: () {
          newOrderController.plusOnTap(context: context);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.height * 0.055,
              width: Get.width * 0.11,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorRes.skyBlue,
                    ColorRes.color8C8CB6,
                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Image.asset(
              AssetRes.plusIcon,
              height: 20,
            ),
          ],
        ),
      ),
    ],
  );
}
