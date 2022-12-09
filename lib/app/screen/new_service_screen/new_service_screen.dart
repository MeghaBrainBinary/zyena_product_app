import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/common/button.dart';
import 'package:product_app/app/common/loaders.dart';
import 'package:product_app/app/common/search_bar.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/common/title_with_textfield.dart';
import 'package:product_app/app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/app/screen/new_service_screen/new_service_controller.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/app/utils/string_res.dart';

class NewServiceScreen extends StatelessWidget {
  NewServiceScreen({super.key});

  final NewServiceController newServiceController =
      Get.put(NewServiceController());

  @override
  Widget build(BuildContext context) {
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
                      title: StringRes.newService,
                      controller: newServiceController.searchController),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50, top: 10),
                      child: Stack(
                        alignment: const Alignment(0, 1.08),
                        children: [
                          Container(
                            width: Get.width,
                            height: Get.height * 0.65,
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
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ]),
                            child: Column(
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
                                dropDown(
                                  context: context,
                                  items: newServiceController.customerNames,
                                  hintText: newServiceController.customerName,
                                  selectedValue:
                                      newServiceController.customerName,
                                ),
                                sizedBoxHeight(height: 0.03),
                                InkWell(
                                  onTap: () {
                                    newServiceController.dateOnTap(
                                        context: context);
                                  },
                                  child: titleWithTextField(
                                      enabled: false,
                                      title: StringRes.date,
                                      hintText: StringRes.date.toLowerCase(),
                                      controller: newServiceController
                                          .dateController.value),
                                ),
                                sizedBoxHeight(height: 0.03),
                                titleWithTextField(
                                    title: StringRes.remark,
                                    hintText: StringRes.remark.toLowerCase(),
                                    controller: newServiceController
                                        .remarkController.value),
                                sizedBoxHeight(height: 0.03),
                                titleWithTextField(
                                    keyboardType: TextInputType.number,
                                    title: StringRes.contactNumber,
                                    hintText:
                                        StringRes.contactNumber.toLowerCase(),
                                    controller: newServiceController
                                        .contactNumberController.value),
                                sizedBoxHeight(height: 0.03),
                              ],
                            ),
                          ),
                          button(
                            text: StringRes.add,
                            onTap: newServiceController.addOnTap,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => (newServiceController.loader.value)
                  ? const Center(
                      child: SmallLoader(),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
