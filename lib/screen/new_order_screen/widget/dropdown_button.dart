import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/keyboard_close.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/helpers/prefs.dart';
import 'package:product_app/screen/new_order_screen/new_order_controller.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/asset_res.dart';
import 'package:product_app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/utils/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:product_app/utils/string_res.dart';

NewOrderController newOrderController = Get.put(NewOrderController());
UserService userService = UserService();

Widget dropDownAndCustomerNamePlusButton({
  required BuildContext context,
  required RxList<String> items,
  required RxString hintText,
  required RxString selectedValue,
}) {
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
          child: Obx(
            (() => DropdownButton(
                  underline: const SizedBox(),

                  // Down Arrow Icon
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: ColorRes.skyBlue,
                  ),
                  isExpanded: true,

                  // value: selectedValue.value == "" ? "" : selectedValue.value,
                  // hint text
                  hint: Text(
                    hintText.value,
                    style: (hintText.value == StringRes.selectProduct ||
                            hintText.value ==
                                StringRes.customerName.toLowerCase())
                        ? appTextStyle(
                            color: ColorRes.skyBlue,
                            fontSize: 13,
                            weight: FontWeight.w300)
                        : TextStyle(color: ColorRes.black),
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    selectedValue.value = newValue!;
                  },
                )),
          ),
        ),
      ),
      sizedBoxWidth(width: 0.05),
      InkWell(
        onTap: () {
          // if (hintText.value == StringRes.customerName.toLowerCase()) {
          newOrderController.customerNameController.value.clear();
          // }
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
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
                                      title: StringRes.customerName
                                          .toString()
                                          .split(" ")[0],
                                      hintText:
                                          StringRes.customerName.toLowerCase(),
                                      controller: newOrderController
                                          .customerNameController.value),
                                  // sizedBoxHeight(height: 0.05),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.07,
                              width: Get.width * 0.5,
                              child: button(
                                  text: StringRes.add,
                                  onTap: () async {
                                    closeKeybord(context: context);

                                    if (newOrderController
                                        .customerNameController
                                        .value
                                        .text
                                        .isNotEmpty) {
                                      hintText.value = newOrderController
                                          .customerNameController.value.text;
                                      newOrderController.customerNames
                                          .add(hintText.value);
                                      newOrderController.load.value = true;

                                      await userService.addCustomerNames(
                                          {"customerName": hintText.value});
                                      newOrderController.load.value = false;

                                      Get.back();
                                    } else {
                                      Get.back();
                                    }
                                  }),
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
                    onTap: () async {
                      closeKeybord(context: context);

                      if (newOrderController
                          .customerNameController.value.text.isNotEmpty) {
                        hintText.value = newOrderController
                            .customerNameController.value.text;
                        newOrderController.customerNames.add(hintText.value);

                        newOrderController.load.value = true;
                        await userService
                            .addCustomerNames({"customerName": hintText.value});
                        newOrderController.load.value = false;

                        Get.back();
                      } else {
                        Get.back();
                      }
                    },
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

Widget dropDownAndProductPlusButton({
  required BuildContext context,
  required RxList<String> items,
  required RxString hintText,
  required RxString selectedValue,
}) {
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
          child: Obx(
            (() => DropdownButton(
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
                    hintText.value,
                    style: (hintText.value == StringRes.selectProduct ||
                            hintText.value ==
                                StringRes.customerName.toLowerCase())
                        ? appTextStyle(
                            color: ColorRes.skyBlue,
                            fontSize: 13,
                            weight: FontWeight.w300)
                        : TextStyle(color: ColorRes.black),
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    selectedValue.value = newValue!;
                  },
                )),
          ),
        ),
      ),
      sizedBoxWidth(width: 0.05),
      InkWell(
        onTap: () {
          // if (hintText.value == StringRes.selectProduct) {
          newOrderController.productNameController.value.clear();
          // }
          //  newOrderController.productPlusOnTap(context: context);
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
                contentPadding: const EdgeInsets.all(0),
                actionsAlignment: MainAxisAlignment.center,
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
                                  controller: newOrderController
                                      .productNameController.value),
                              sizedBoxHeight(height: 0.05),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                          width: Get.width * 0.5,
                          child: button(
                              text: StringRes.add,
                              onTap: () {
                                closeKeybord(context: context);

                                hintText.value = newOrderController
                                    .productNameController.value.text;
                                newOrderController.products.add(hintText.value);
                                Get.back();
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      closeKeybord(context: context);
                      hintText.value =
                          newOrderController.productNameController.value.text;
                      newOrderController.products.add(hintText.value);

                      Get.back();
                    },
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

Widget dropDown({
  required BuildContext context,
  required RxList<String> items,
  required RxString hintText,
  required RxString selectedValue,
}) {
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
                    hintText.value,
                    style: (hintText.value == StringRes.selectProduct ||
                            hintText.value ==
                                StringRes.customerName.toLowerCase())
                        ? appTextStyle(
                            color: ColorRes.skyBlue,
                            fontSize: 13,
                            weight: FontWeight.w300)
                        : TextStyle(color: ColorRes.black),
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    selectedValue.value = newValue!;
                  },
                )))),
      ),
    ],
  );
}

Widget orderDropDown({
  required BuildContext context,
  required RxList<String> items,
  required RxString hintText,
  required RxString selectedValue,
  required RxBool isProduct,
}) {
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
              color: ColorRes.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.grey.shade300,
                ),
              ],
              // border: Border.all(color: ColorRes.skyBlue, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Obx((() => DropdownButton(
                  underline: const SizedBox(),

                  // Down Arrow Icon
                  icon: const SizedBox(),
                  //  Icon(
                  //   Icons.keyboard_arrow_down,
                  //   size: 20,
                  //   color: ColorRes.skyBlue,
                  // ),
                  isExpanded: false,

                  // hint text
                  hint: Text(
                    hintText.value,
                    style: (hintText.value ==
                                StringRes.productName.toLowerCase() ||
                            hintText.value == StringRes.selectProduct ||
                            hintText.value ==
                                StringRes.customerName.toLowerCase())
                        ? appTextStyle(
                            color: ColorRes.skyBlue,
                            fontSize: 13,
                            weight: FontWeight.w300)
                        : TextStyle(color: ColorRes.black),
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) async {
                    selectedValue.value = newValue!;
                    orderController.customerNameFilterval.value = newValue;

                    if (isProduct.value) {
                      PrefService.setValue("proName", selectedValue.value);
                      orderController.proName.value = selectedValue.value;
                      // await FirebaseFirestore.instance
                      //     .collection(FireStoreCollections.newOrder)
                      //     .get()
                      //     .then((value) {
                      //   for (int i = 0; i < value.docs.length; i++) {
                      //     if (value.docs[i]['product'] == selectedValue.value) {
                      //       proId.add(value.docs[i].id);
                      //       orderController.proNameId.value =
                      //           LinkedHashSet<String>.from(proId).toList();
                      //       print("proNameId -=> ${value.docs[i].id}");
                      //     }
                      //   }
                      // });

                      orderController.stream.value = FirebaseFirestore.instance
                          .collection(FireStoreCollections.newOrder)
                          .where("customerName",
                              isEqualTo: PrefService.getString('cusName'))
                          .where("product", isEqualTo: selectedValue.value)
                          // .doc(orderController.cusNameId[i].toString())
                          .snapshots();
                    } else {
                      orderController.cusName.value = selectedValue.value;
                      PrefService.setValue(
                          "cusName", selectedValue.value.toString());
                      print(
                          "cusname prefs ==> ${PrefService.getString('cusName')}");
                      orderController.stream.value = FirebaseFirestore.instance
                          .collection(FireStoreCollections.newOrder)
                          .where("customerName", isEqualTo: selectedValue.value)
                          .snapshots();
                      // await FirebaseFirestore.instance
                      //     .collection(FireStoreCollections.newOrder)
                      //     .get()
                      //     .then((value) {
                      //   for (int i = 0; i < value.docs.length; i++) {
                      //     if (value.docs[i]['customerName'] ==
                      //         selectedValue.value) {
                      //       cusId.add(value.docs[i].id);
                      //       orderController.cusNameId.value =
                      //           LinkedHashSet<String>.from(cusId).toList();
                      //       print("cusNameId -=> ${value.docs[i].id}");
                      //     }
                      //   }
                      // });
                      // if (PrefService.getString('proName') != "") {
                      //   orderController.stream.value = FirebaseFirestore
                      //       .instance
                      //       .collection(FireStoreCollections.newOrder)
                      //       .where("customerName",
                      //           isEqualTo: selectedValue.value)
                      //       .where('product',
                      //           isEqualTo: PrefService.getString('proName'))
                      //       // .doc(orderController.cusNameId[i].toString())
                      //       .snapshots();
                      // } else {
                      orderController.stream.value = FirebaseFirestore.instance
                          .collection(FireStoreCollections.newOrder)
                          .where("customerName", isEqualTo: selectedValue.value)

                          // .doc(orderController.cusNameId[i].toString())
                          .snapshots();
                      // }
                    }
                  },
                )))),
      ),
    ],
  );
}

Widget serviceDropDown({
  required BuildContext context,
  required RxList<String> items,
  required RxString hintText,
  required RxString selectedValue,
}) {
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
              color: ColorRes.white,
              // border: Border.all(color: ColorRes.skyBlue, width: 0.5),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: Colors.grey.shade300,
                )
              ],
            ),
            child: Obx((() => DropdownButton(
                  underline: const SizedBox(),

                  // Down Arrow Icon
                  icon: const SizedBox(),
                  // Icon(
                  //   Icons.keyboard_arrow_down,
                  //   size: 20,
                  //   color: ColorRes.skyBlue,
                  // ),
                  isExpanded: true,

                  // hint text
                  hint: Text(
                    hintText.value,
                    style: (hintText.value == StringRes.selectProduct ||
                            hintText.value ==
                                StringRes.customerName.toLowerCase())
                        ? appTextStyle(
                            color: ColorRes.skyBlue,
                            fontSize: 12,
                            weight: FontWeight.w300,
                          )
                        : TextStyle(color: ColorRes.black),
                  ),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    selectedValue.value = newValue!;
                    orderController.customerNameFilterval.value = newValue;
                    orderController.serviceStream.value = FirebaseFirestore
                        .instance
                        .collection(FireStoreCollections.newService)
                        .where("serviceCustomerName",
                            isEqualTo: selectedValue.value)
                        .snapshots();
                  },
                )))),
      ),
    ],
  );
}
