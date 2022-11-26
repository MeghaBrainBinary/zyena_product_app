import 'package:flutter/material.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/screen/home_screen/home_page_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/screen/home_screen/widgets/container_with_text.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class HomeScreen extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => homePageController.isLoad.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                                height: Get.height / 3,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      ColorRes.skyBlue,
                                      const Color(0xFF8C8CB6),
                                    ]))),
                            Container(
                                height: Get.height / 2,
                                decoration:
                                    const BoxDecoration(color: Colors.white))
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  sizedBoxHeight(height: 0.09),
                                  Text(
                                    StringRes.agenciesCHENNAI,
                                    style: appTextStyle(
                                        color: ColorRes.white,
                                        fontSize: 20,
                                        weight: FontWeight.w500),
                                  ),
                                  sizedBoxHeight(height: 0.008),
                                  Stack(
                                    alignment: const Alignment(0, 1.06),
                                    children: [
                                      Container(
                                        width: Get.width,
                                        height: Get.height / 1.3,
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  spreadRadius: 0.5,
                                                  offset: const Offset(1, 1),
                                                  color: Colors.grey
                                                      .withOpacity(0.3))
                                            ]),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    containerWithText(
                                                        onTap:
                                                            homePageController
                                                                .newOrderOnTap,
                                                        image:
                                                            AssetRes.newOrder,
                                                        text:
                                                            StringRes.newOrder),
                                                    containerWithText(
                                                        onTap:
                                                            homePageController
                                                                .orderListOnTap,
                                                        image:
                                                            AssetRes.orderList,
                                                        text: StringRes
                                                            .orderList),
                                                  ],
                                                ),
                                                Container(
                                                  height: Get.height * 0.001,
                                                  color: ColorRes.skyBlue,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    containerWithText(
                                                        onTap: homePageController
                                                            .pendingOrderOnTap,
                                                        image: AssetRes
                                                            .pendingOrder,
                                                        text: StringRes
                                                            .pendingOrder),
                                                    containerWithText(
                                                        onTap:
                                                            homePageController
                                                                .deliveredOnTap,
                                                        image:
                                                            AssetRes.delivered,
                                                        text: StringRes
                                                            .delivered),
                                                  ],
                                                ),
                                                Container(
                                                  height: Get.height * 0.001,
                                                  color: ColorRes.skyBlue,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    containerWithText(
                                                        onTap: homePageController
                                                            .returnOrderOnTap,
                                                        image: AssetRes
                                                            .returnOrder,
                                                        text: StringRes
                                                            .returnOrder),
                                                    containerWithText(
                                                        onTap: homePageController
                                                            .newServiceOnTap,
                                                        image:
                                                            AssetRes.newService,
                                                        text: StringRes
                                                            .newService),
                                                  ],
                                                ),
                                                Container(
                                                  height: Get.height * 0.001,
                                                  color: ColorRes.skyBlue,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    containerWithText(
                                                        onTap: homePageController
                                                            .pendingServiceOnTap,
                                                        image: AssetRes
                                                            .pendingService,
                                                        text: StringRes
                                                            .pendingService),
                                                    containerWithText(
                                                        onTap: homePageController
                                                            .completeServiceOnTap,
                                                        image: AssetRes
                                                            .completeService,
                                                        text: StringRes
                                                            .completeService),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: Get.width * 0.001,
                                              color: ColorRes.skyBlue,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

          // Column(
          //     children: [
          //       Text("Select product"),
          //       Obx(() => DropdownButton<ProductModel?>(
          //         value: homePageController.product.value.name==null?null:homePageController.product.value,
          //           hint: Text("Select Product"),
          //           items: homePageController.productList.
          //           map((ProductModel model) {
          //             return DropdownMenuItem<ProductModel>(
          //               value: model,
          //               child: Text(model.name!),
          //             );
          //           }).toList(),
          //           onChanged: (ProductModel? value) {
          //             homePageController.onChange(value!);
          //           })),
          //       SizedBox(height: 20,),
          //       Text(DateFormat('MMM d,yyyy').format(DateTime.now()))
          //   ],
          // )
        ),
      ),
    );
  }
}