import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/screen/new_order_screen/new_order_controller.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class NewOrderScreen extends StatelessWidget {
  NewOrderScreen({super.key});

  final NewOrderController newOrderController = Get.put(NewOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: searchBar(
                title: StringRes.newOrder,
                controller: newOrderController.searchController,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Stack(
                    alignment: const Alignment(0, 1.06),
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height / 1.3,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleWithTextField(
                                title: StringRes.customerName,
                                hintText: StringRes.customerName.toLowerCase(),
                                controller:
                                    newOrderController.customerNameController),
                            sizedBoxHeight(height: 0.03),
                            Text(
                              StringRes.product,
                              style: appTextStyle(
                                  color: ColorRes.skyBlue,
                                  fontSize: 15,
                                  weight: FontWeight.w500),
                            ),
                            sizedBoxHeight(height: 0.02),
                            dropDownAndPlusButtonRow(context: context),
                            sizedBoxHeight(height: 0.03),
                            titleWithTextField(
                                title: StringRes.orderDate,
                                hintText: StringRes.date.toLowerCase(),
                                controller:
                                    newOrderController.orderDateController),
                            sizedBoxHeight(height: 0.03),
                            titleWithTextField(
                                title: StringRes.expirationDate,
                                hintText: StringRes.date.toLowerCase(),
                                controller:
                                    newOrderController.expirationController),
                            sizedBoxHeight(height: 0.03),
                            titleWithTextField(
                                title: StringRes.contactNumber,
                                hintText: StringRes.contactNumber.toLowerCase(),
                                controller:
                                    newOrderController.contactNumberController),
                            sizedBoxHeight(height: 0.03),
                          ],
                        ),
                      ),
                      button(text: StringRes.add, onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
