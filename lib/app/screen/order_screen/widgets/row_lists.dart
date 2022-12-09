import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_app/app/common/button.dart';
import 'package:product_app/app/common/loaders.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/notification/notification_model.dart';
import 'package:product_app/app/notification/notification_service.dart';
import 'package:product_app/app/screen/home_screen/home_page_controller.dart';
import 'package:product_app/app/screen/new_order_screen/new_order_controller.dart';
import 'package:product_app/app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/app/screen/order_screen/widgets/customer_popup.dart';
import 'package:product_app/app/service/user_service.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/app/utils/firestore_collections.dart';
import 'package:product_app/app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

NewOrderController newOrderController = Get.put(NewOrderController());

orderListDataRow(
    {required dynamic e, required int i, required BuildContext context}) {
  return DataRow.byIndex(
    // selected: false,
    onSelectChanged: (value) {
      if (value!) {
        if (kDebugMode) {
          print("jvgbhndxfu");
          print(e['customerName']);
        }
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
                        alignment: const Alignment(0, 1.2),
                        children: [
                          Container(
                            height: Get.height / 2.35,
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
                                  StringRes.order,
                                  style: appTextStyle(
                                      color: ColorRes.skyBlue,
                                      fontSize: 20,
                                      weight: FontWeight.w500),
                                ),
                                sizedBoxHeight(height: 0.03),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.customerName} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['customerName']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.productName} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['product']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.orderDate} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['orderDate']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.deliveryDate} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['expirationDate']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.contactNumber} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['contactNumber']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.status} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['status']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.07,
                            width: Get.width * 0.5,
                            child: button(
                                text: StringRes.delete,
                                onTap: () async {
                                  newOrderController.load.value = true;
                                  await FirebaseFirestore.instance
                                      .collection(FireStoreCollections.newOrder)
                                      .doc(e.id)
                                      .delete();
                                  // orderController.customerNames
                                  //     .remove(e['customerName']);
                                  newOrderController.load.value = false;
                                  Get.back();
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
                    newOrderController.load.value = true;
                    await FirebaseFirestore.instance
                        .collection(FireStoreCollections.newOrder)
                        .doc(e.id.toString())
                        .delete();
                    // orderController.customerNames.remove(e['customerName']);
                    newOrderController.load.value = false;
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
      }
    },
    color: (e['status'] == "cancel")
        ? MaterialStateColor.resolveWith(
            (states) => Colors.redAccent.withOpacity(0.1))
        : MaterialStateColor.resolveWith((states) => ColorRes.white),
    index: i,
    cells: <DataCell>[
      DataCell(Center(
          child: Text(
        "$i",
        style: orderController.rowTextStyle,
      ))), //Extracting from Map element the value
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['product']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['orderDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['expirationDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['contactNumber']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['status']}",
        style: orderController.rowTextStyle,
      ))),
    ],
  );
}

DataRow customersDataRow(
    {required dynamic e, required int i, required BuildContext context}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
          style: orderController.rowTextStyle,
        ),
      )), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(onTap: () {
        newOrderController.customerNameUpdateController.value.text =
            e['customerName'];
        popup(
            context: context,
            title: StringRes.customerName.toString().split(" ")[0],
            hintText: StringRes.customerName.toLowerCase(),
            controller: newOrderController.customerNameUpdateController.value,
            onTap: () async {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              newOrderController.load.value = true;
              await FirebaseHelper.firebaseHelper.firebaseFirestore
                  .collection(FireStoreCollections.newOrder)
                  .doc("${e.id}")
                  .update({
                "customerName":
                    newOrderController.customerNameUpdateController.value.text,
              });
              newOrderController.load.value = false;
              Get.back();
            });
      },
          Center(
              child: Text(
            StringRes.edit,
            style: orderController.rowTextStyle,
          ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(onTap: () async {
        newOrderController.load.value = true;
        await FirebaseHelper.firebaseHelper.firebaseFirestore
            .collection(FireStoreCollections.newOrder)
            .doc("${e.id}")
            .update({
          "customerName": "",
        });
        newOrderController.load.value = false;
      },
          Center(
              child: Text(
            StringRes.delete,
            style: orderController.rowTextStyle,
          ))),
    ],
  );
}

DataRow productsDataRow(
    {required dynamic e,
    required int i,
    required BuildContext context,
    required int length}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(
        Center(
          child: Text(
            "$i",
            style: orderController.rowTextStyle,
          ),
        ),
      ), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        Center(
          child: Text(
            "${e['product']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        onTap: () {
          newOrderController.productNameUpdateController.value.text =
              e['product'];
          popup(
              context: context,
              title: StringRes.product.toString().split(" ")[0],
              hintText: StringRes.product.toLowerCase(),
              controller: newOrderController.productNameUpdateController.value,
              onTap: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                newOrderController.load.value = true;
                await FirebaseHelper.firebaseHelper.firebaseFirestore
                    .collection(FireStoreCollections.newOrder)
                    .doc("${e.id}")
                    .update({
                  "product":
                      newOrderController.productNameUpdateController.value.text,
                });
                newOrderController.load.value = false;
                Get.back();
              });
        },
        Center(
          child: Text(
            StringRes.edit,
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        onTap: () async {
          newOrderController.load.value = true;
          await FirebaseFirestore.instance
              .collection(FireStoreCollections.newOrder)
              .doc("${e.id}")
              .update({
            "product": "",
          });
          newOrderController.load.value = false;
        },
        Center(
          child: Text(
            StringRes.delete,
            style: orderController.rowTextStyle,
          ),
        ),
      ),
    ],
  );
}

DataRow pendingOrderDataRow(
    {required dynamic e, required int i, required BuildContext context}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
          style: orderController.rowTextStyle,
        ),
      )), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['product']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['orderDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['expirationDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(onTap: () {
        showDialog(
          barrierDismissible: false,
          barrierColor: ColorRes.black.withOpacity(0.65),
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
            orderController.selectedOrder.value =
                StringRes.changeOrderStatus.toLowerCase();
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
                        alignment: const Alignment(0, 1.25),
                        children: [
                          Container(
                            height: Get.height / 2.6,
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
                                  StringRes.changeOrderStatus,
                                  style: appTextStyle(
                                      color: ColorRes.skyBlue,
                                      fontSize: 20,
                                      weight: FontWeight.w500),
                                ),
                                sizedBoxHeight(height: 0.03),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.customerName} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['customerName']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.productName} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['product']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.012),
                                Row(
                                  children: [
                                    Text(
                                      "${StringRes.orderDate} : ",
                                      style: orderController.rowTextStyle,
                                    ),
                                    Text(
                                      "${e['orderDate']}",
                                      style: orderController.rowTextStyle,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(height: 0.03),
                                dropDown(
                                    context: context,
                                    items: orderController.orderStatus,
                                    hintText: orderController.selectedOrder,
                                    selectedValue:
                                        orderController.selectedOrder),
                                // titleWithTextField(
                                //     title: StringRes.status,
                                //     hintText:
                                //         StringRes.customerName.toLowerCase(),
                                //     controller: newOrderController
                                //         .customerNameController.value),
                                // sizedBoxHeight(height: 0.05),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.07,
                            width: Get.width * 0.5,
                            child: button(
                                text: StringRes.update,
                                onTap: () async {
                                  print(
                                      "===========================================");
                                  print(
                                      "order =====> ${orderController.selectedOrder.value}");
                                  // if (orderController.selectedOrder.value !=
                                  //     StringRes.status.toLowerCase()) {
                                  newOrderController.load.value = true;
                                  if (orderController.selectedOrder.value ==
                                      "cancel") {
                                    orderController.present.value = true;
                                  }
                                  await FirebaseFirestore.instance
                                      .collection(FireStoreCollections.newOrder)
                                      .doc(e.id)
                                      .update({
                                    "status": orderController
                                        .selectedOrder.value
                                        .toString(),
                                  });

                                  await FirebaseHelper
                                      .firebaseHelper.firebaseFirestore
                                      .collection("users")
                                      .get()
                                      .then((value) {
                                    if (value.docs.length.isEqual(0)) {
                                    } else {
                                      for (int i = 0;
                                          i < value.docs.length;
                                          i++) {
                                        if (value.docs[i].id !=
                                            PrefService.getString(
                                                PrefKeys.uid)) {
                                          NotificationService.sendNotification(
                                              SendNotificationModel(
                                            fcmTokens: [
                                              value.docs[i]['fcmToken']
                                            ],
                                            title: "Order status",
                                            body:
                                                "${e['customerName']} order ${orderController.selectedOrder.value.toString()} ",
                                          ));
                                        }
                                      }
                                    }
                                  });

                                  newOrderController.load.value = false;
                                  Get.back();
                                  // } else {
                                  //   snakBar(
                                  //       title: StringRes.error,
                                  //       text: "Please select status");
                                  // }
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
                    print("===========================================");
                    print(
                        "order =====> ${orderController.selectedOrder.value}");
                    // if (orderController.selectedOrder.value !=
                    //     StringRes.status.toLowerCase()) {
                    newOrderController.load.value = true;
                    if (orderController.selectedOrder.value == "cancel") {
                      orderController.present.value = true;
                    }
                    await FirebaseFirestore.instance
                        .collection(FireStoreCollections.newOrder)
                        .doc(e.id)
                        .update({
                      "status": orderController.selectedOrder.value.toString(),
                    });
                    await FirebaseHelper.firebaseHelper.firebaseFirestore
                        .collection("users")
                        .get()
                        .then((value) {
                      if (value.docs.length.isEqual(0)) {
                      } else {
                        for (int i = 0; i < value.docs.length; i++) {
                          if (value.docs[i].id !=
                              PrefService.getString(PrefKeys.uid)) {
                            NotificationService.sendNotification(
                                SendNotificationModel(
                              fcmTokens: [value.docs[i]['fcmToken']],
                              title: "Order status",
                              body:
                                  "${e['customerName']} order ${orderController.selectedOrder.value.toString()} ",
                            ));
                          }
                        }
                      }
                    });
                    newOrderController.load.value = false;
                    Get.back();
                    // } else {
                    //   snakBar(
                    //       title: StringRes.error, text: "Please select status");
                    // }
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
          Center(
              child: Text(
            "${e['status']}",
            style: orderController.rowTextStyle,
          ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['contactNumber']}",
        style: orderController.rowTextStyle,
      ))),
    ],
  );
}

DataRow deliveredDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
          style: orderController.rowTextStyle,
        ),
      )), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['product']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['orderDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['expirationDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['contactNumber']}",
        style: orderController.rowTextStyle,
      ))),
    ],
  );
}

DataRow proDataRow() {
  return const DataRow(cells: <DataCell>[
    DataCell(
      Center(
        child: Text("1"),
      ),
    ),
    DataCell(
      Center(
        child: Text("products"),
      ),
    ),
  ]);
}

DataRow returnOrderDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
          child: Text(
        "$i",
        style: orderController.rowTextStyle,
      ))), //Extracting from Map element the value
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['product']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['orderDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['expirationDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['contactNumber']}",
        style: orderController.rowTextStyle,
      ))),
    ],
  );
}

DataRow pendingServiceDataRow(
    {required dynamic e, required int i, required BuildContext context}) {
  return DataRow(
    onSelectChanged: (value) {
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
                            child: Icon(
                              Icons.close,
                              color: ColorRes.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: const Alignment(0, 1.2),
                      children: [
                        Container(
                          height: Get.height / 2.8,
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
                                StringRes.service,
                                style: appTextStyle(
                                    color: ColorRes.skyBlue,
                                    fontSize: 20,
                                    weight: FontWeight.w500),
                              ),
                              sizedBoxHeight(height: 0.03),
                              Row(
                                children: [
                                  Text(
                                    "${StringRes.customerName} : ",
                                    style: orderController.rowTextStyle,
                                  ),
                                  Text(
                                    "${e['serviceCustomerName']}",
                                    style: orderController.rowTextStyle,
                                  ),
                                ],
                              ),
                              sizedBoxHeight(height: 0.012),
                              Row(
                                children: [
                                  Text(
                                    "${StringRes.service} : ",
                                    style: orderController.rowTextStyle,
                                  ),
                                  Text(
                                    "${e['serviceRemark']}",
                                    style: orderController.rowTextStyle,
                                  ),
                                ],
                              ),
                              sizedBoxHeight(height: 0.012),
                              Row(
                                children: [
                                  Text(
                                    "${StringRes.date} : ",
                                    style: orderController.rowTextStyle,
                                  ),
                                  Text(
                                    "${e['serviceDate']}",
                                    style: orderController.rowTextStyle,
                                  ),
                                ],
                              ),
                              sizedBoxHeight(height: 0.012),
                              Row(
                                children: [
                                  Text(
                                    "${StringRes.contactNumber} : ",
                                    style: orderController.rowTextStyle,
                                  ),
                                  Text(
                                    "${e['serviceContactNumber']}",
                                    style: orderController.rowTextStyle,
                                  ),
                                ],
                              ),
                              sizedBoxHeight(height: 0.012),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                          width: Get.width * 0.5,
                          child: button(
                              text: StringRes.delete,
                              onTap: () async {
                                newOrderController.load.value = true;
                                await FirebaseFirestore.instance
                                    .collection(FireStoreCollections.newService)
                                    .doc(e.id)
                                    .delete();
                                // orderController.customerNames.value = [];
                                // orderController.customerNames
                                //     .remove(e['serviceCustomerName']);
                                // await orderController
                                //     .getPendingServiceCustomerNames();
                                newOrderController.load.value = false;
                                Get.back();
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
                  newOrderController.load.value = true;
                  await FirebaseFirestore.instance
                      .collection(FireStoreCollections.newService)
                      .doc(e.id.toString())
                      .delete();
                  // orderController.customerNames.value = [];
                  // orderController.customerNames
                  //     .remove(e['serviceCustomerName']);
                  // await orderController.getPendingServiceCustomerNames();
                  newOrderController.load.value = false;
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
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
          style: orderController.rowTextStyle,
        ),
      )), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['serviceCustomerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['serviceRemark']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['serviceDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(Center(
          child: Text(
        "${e['serviceContactNumber']}",
        style: orderController.rowTextStyle,
      ))),
    ],
  );
}

DataRow completeServiceDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(
        Center(
          child: Text(
            "$i",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceCustomerName']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceRemark']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceDate']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceContactNumber']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
    ],
  );
}
