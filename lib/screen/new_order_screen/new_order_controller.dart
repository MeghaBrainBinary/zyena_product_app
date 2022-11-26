import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class NewOrderController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController orderDateController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController productNameController = TextEditingController();

  // RxString dropdownVal = "Product".obs;
  RxString selectProduct = StringRes.selectProduct.obs;

  List<String> products = [
    "product",
    "product-1",
    "product-2",
    "product-3",
    "product-4",
    "product-5",
  ];

  /// plus button onTap
  void plusOnTap({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      barrierColor: ColorRes.black.withOpacity(0.65),
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Column(
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
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
                          StringRes.addProduct,
                          style: appTextStyle(
                              color: ColorRes.skyBlue,
                              fontSize: 20,
                              weight: FontWeight.w500),
                        ),
                        sizedBoxHeight(height: 0.03),
                        titleWithTextField(
                            title: StringRes.product,
                            hintText: StringRes.productName.toLowerCase(),
                            controller: productNameController),
                        sizedBoxHeight(height: 0.05),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                    width: Get.width * 0.5,
                    child: button(text: StringRes.add, onTap: () {}),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
