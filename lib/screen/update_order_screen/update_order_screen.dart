import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/screen/update_order_screen/update_order_controller.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class UpdateOrderScreen extends StatelessWidget {
  UpdateOrderScreen({super.key});

  final UpdateOrderController updateOrderController =
      Get.put(UpdateOrderController());

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    updateOrderController.contactNumberController.value.text =
        args[0]['contactNumber'];

    updateOrderController.expirationController.value.text =
        args[0]['expirationDate'];

    updateOrderController.customerName.value = args[0]['customerName'];
    updateOrderController.selectProduct.value = args[0]['product'];

    updateOrderController.orderDateController.value.text = args[0]['orderDate'];

    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 0,
                  child: searchBar(
                    isSearch: false,
                    title: StringRes.updateOrder,
                    controller: updateOrderController.searchController,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50, top: 10),
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
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringRes.customerName,
                                    style: appTextStyle(
                                      color: ColorRes.skyBlue,
                                      fontSize: 15,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  sizedBoxHeight(height: 0.02),
                                  dropDownAndCustomerNamePlusButton(
                                    context: context,
                                    items: updateOrderController.customerNames,
                                    hintText:
                                        updateOrderController.customerName,
                                    selectedValue:
                                        updateOrderController.customerName,
                                  ),
                                  sizedBoxHeight(height: 0.03),
                                  Text(
                                    StringRes.product,
                                    style: appTextStyle(
                                        color: ColorRes.skyBlue,
                                        fontSize: 15,
                                        weight: FontWeight.w500),
                                  ),
                                  sizedBoxHeight(height: 0.02),
                                  dropDownAndProductPlusButton(
                                    context: context,
                                    items: updateOrderController.products,
                                    hintText:
                                        updateOrderController.selectProduct,
                                    selectedValue:
                                        updateOrderController.selectProduct,
                                  ),
                                  sizedBoxHeight(height: 0.03),
                                  InkWell(
                                    onTap: () {
                                      updateOrderController.orderDateOnTap(
                                          context: context);
                                    },
                                    child: titleWithTextField(
                                        enabled: false,
                                        title: StringRes.orderDate,
                                        hintText:
                                            StringRes.orderDate.toLowerCase(),
                                        controller: updateOrderController
                                            .orderDateController.value),
                                  ),
                                  sizedBoxHeight(height: 0.03),
                                  InkWell(
                                    onTap: () {
                                      updateOrderController.expirationDateOnTap(
                                          context: context);
                                    },
                                    child: titleWithTextField(
                                        enabled: false,
                                        title: StringRes.expirationDate,
                                        hintText: StringRes.expirationDate
                                            .toLowerCase(),
                                        controller: updateOrderController
                                            .expirationController.value),
                                  ),
                                  sizedBoxHeight(height: 0.03),
                                  titleWithTextField(
                                      keyboardType: TextInputType.number,
                                      title: StringRes.contactNumber,
                                      hintText:
                                          StringRes.contactNumber.toLowerCase(),
                                      controller: updateOrderController
                                          .contactNumberController.value),
                                  sizedBoxHeight(height: 0.03),
                                ],
                              ),
                            ),
                          ),
                          button(
                            text: StringRes.edit,
                            onTap: () {
                              updateOrderController.addOnTap(
                                  val: args[0], id: args[1]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => (updateOrderController.loader.value)
                  ? const Center(child: SmallLoader())
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
