import 'package:flutter/material.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/screen/home_screen/home_page_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/screen/home_screen/widgets/container_with_text.dart';
import 'package:product_app/app/screen/home_screen/widgets/home_background.dart';
import 'package:product_app/app/utils/approutes.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/asset_res.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/app/utils/string_res.dart';

class HomeScreen extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
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
                          homeBackGround(),
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    sizedBoxHeight(height: 0.09),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Visibility(
                                            maintainState: true,
                                            maintainAnimation: true,
                                            maintainSize: true,
                                            visible: false,
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: Image.asset(
                                                AssetRes.logoutIcon,
                                                height: 50,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              // color: ColorRes.black,
                                              child: Text(
                                                "Hello ${PrefService.getString("username")}",
                                                overflow: TextOverflow.ellipsis,
                                                style: appTextStyle(
                                                    color: ColorRes.white,
                                                    fontSize: 20,
                                                    weight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              PrefService.setValue(
                                                  PrefKeys.isLogin, false);
                                              Get.offNamed(
                                                AppRoutes.sigInPage,
                                              );
                                            },
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: Image.asset(
                                                AssetRes.logoutIcon,
                                                height: 50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    sizedBoxHeight(height: 0.008),
                                    Stack(
                                      alignment: const Alignment(0, 1.06),
                                      children: [
                                        Container(
                                          width: Get.width,
                                          height: Get.height / 1.38,
                                          margin: const EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
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
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      containerWithText(
                                                          onTap: () {
                                                            homePageController
                                                                .newOrderOnTap(
                                                                    context:
                                                                        context);
                                                          },
                                                          image:
                                                              AssetRes.newOrder,
                                                          text: StringRes
                                                              .newOrder),
                                                      containerWithText(
                                                          onTap:
                                                              homePageController
                                                                  .orderListOnTap,
                                                          image: AssetRes
                                                              .orderList,
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
                                                          image: AssetRes
                                                              .delivered,
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
                                                          image: AssetRes
                                                              .newService,
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
                                                          onTap:
                                                              homePageController
                                                                  .customersOnTap,
                                                          image: "",
                                                          text: StringRes
                                                              .customers),
                                                      containerWithText(
                                                          onTap:
                                                              homePageController
                                                                  .productsOnTap,
                                                          image: "",
                                                          text: StringRes
                                                              .products),
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
                                    (PrefService.getString(PrefKeys.userType) ==
                                            "Admin")
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 25, bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.offNamed(
                                                        AppRoutes.signupPage);
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    // color: Colors.black,
                                                    width: 100,
                                                    height: 30,
                                                    child: Text(
                                                      StringRes.signup,
                                                      style: appTextStyle(
                                                          color:
                                                              ColorRes.skyBlue,
                                                          fontSize: 13,
                                                          weight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
