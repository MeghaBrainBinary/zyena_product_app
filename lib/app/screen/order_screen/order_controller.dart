import 'dart:collection';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/screen/order_screen/widgets/row_lists.dart';
import 'package:product_app/app/service/user_service.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/app/utils/firestore_collections.dart';
import 'package:product_app/app/utils/string_res.dart';

OrderController orderController = Get.put(OrderController());

class OrderController extends GetxController implements GetxService {
  Rx<TextEditingController> orderListSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> pendingOrderSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> deliveredSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> returnOrderSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> pendingServiceController =
      TextEditingController().obs;
  Rx<TextEditingController> completeServiceController =
      TextEditingController().obs;
  RxString customerName = StringRes.customerName.toLowerCase().obs;
  RxString productName = StringRes.productName.toLowerCase().obs;
  RxList<String> customerNames = <String>[].obs;
  // RxList<String> serviceCustomerNames = <String>[].obs;
  RxList<String> productNames = <String>[].obs;

  RxList<String> orderStatus = [
    "pending",
    "delivered",
    "return",
    "cancel",
  ].obs;

  RxString val = "".obs;
  RxBool present = false.obs;
  RxString cusName = "".obs;
  RxString proName = "".obs;
  RxList proNameId = [].obs;
  RxList cusNameId = [].obs;
  RxString customerNameFilterval = "".obs;
  Widget verticalDivider = VerticalDivider(
    color: ColorRes.color9A9ABF,
    thickness: 1,
  );
  RxList orderListData = [].obs;
  RxList pendingSearchList = [].obs;
  RxList deliveredSearchList = [].obs;
  RxList returnSearchList = [].obs;
  RxList pendingServiceList = [].obs;
  RxList completeServiceList = [].obs;
  RxBool isService = false.obs;
  Rx<Stream> stream = const Stream.empty().obs;
  RxString selectedOrder = StringRes.changeOrderStatus.toLowerCase().obs;

  orderListDataRows({required List list, required BuildContext context}) {
    int i = 1;
    orderController.orderListData.value = list.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['expirationDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...list.map(
              (e) => orderListDataRow(e: e, i: i++, context: context),
            ),
          ]
        : (orderController.customerName.value.isNotEmpty)
            ? <DataRow>[
                ...orderController.orderListData.map(
                  (e) => orderListDataRow(e: e, i: i++, context: context),
                ),
              ]
            : <DataRow>[
                ...orderController.orderListData.map(
                  (e) => orderListDataRow(e: e, i: i++, context: context),
                ),
              ];
  }

  customersDataRows({required List list, required BuildContext context}) {
    int i = 1;
    list.removeWhere(
        (element) => ["", null, false, 0].contains(element['customerName']));

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...list.map(
              (e) => customersDataRow(e: e, i: i++, context: context),
            ),
          ]
        : <DataRow>[];
  }

  RxList orderCustomerNames = [].obs;
  getCustomerNames() async {
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          orderCustomerNames.add(value.docs[i]['customerName']);
          customerNames.value =
              LinkedHashSet<String>.from(orderCustomerNames).toList();
        }
      }
    });
  }

  RxList pendingOrderCustomerNames = [].obs;
  getPendingCustomerNames() async {
    customerNames.value = [];
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .where("status", isEqualTo: "pending")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "pending") {
            pendingOrderCustomerNames.add(value.docs[i]['customerName']);
            customerNames.value =
                LinkedHashSet<String>.from(pendingOrderCustomerNames).toList();
          } else {
            customerNames.value = [];
          }
        }
      }
    });
  }

  RxList deliveredOrderCustomerNames = [].obs;
  getDeliveredCustomerNames() async {
    customerNames.value = [];
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .where("status", isEqualTo: "delivered")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "delivered") {
            deliveredOrderCustomerNames.add(value.docs[i]['customerName']);
            customerNames.value =
                LinkedHashSet<String>.from(deliveredOrderCustomerNames)
                    .toList();
          } else {
            customerNames.value = [];
          }
        }
      }
    });
  }

  RxList returnOrderCustomerNames = [].obs;
  getReturnCustomerNames() async {
    customerNames.value = [];

    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .where("status", isEqualTo: "return")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "return") {
            returnOrderCustomerNames.add(value.docs[i]['customerName']);
            customerNames.value =
                LinkedHashSet<String>.from(returnOrderCustomerNames).toList();
          } else {
            customerNames.value = [];
          }
        }
      }
    });
  }

  RxList orderProductName = [].obs;

  getProductNames() async {
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection(FireStoreCollections.newOrder)
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          orderProductName.add(value.docs[i]['product']);
          productNames.value =
              LinkedHashSet<String>.from(orderProductName).toList();
        }
      }
    });
  }

  RxList pendingOrderProductName = [].obs;

  getPendingProductNames() async {
    productNames.value = [];
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection(FireStoreCollections.newOrder)
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "pending") {
            pendingOrderProductName.add(value.docs[i]['product']);
            productNames.value =
                LinkedHashSet<String>.from(pendingOrderProductName).toList();
          } else {
            productNames.value = [];
          }
        }
      }
    });
  }

  RxList deliveredOrderProductName = [].obs;

  getDeliveredProductNames() async {
    productNames.value = [];
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection(FireStoreCollections.newOrder)
        .where("status", isEqualTo: 'delivered')
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "delivered") {
            deliveredOrderProductName.add(value.docs[i]['product']);
            productNames.value =
                LinkedHashSet<String>.from(deliveredOrderProductName).toList();
          } else {
            productNames.value = [];
          }
        }
      }
    });
  }

  RxList returnOrderProductName = [].obs;

  getReturnProductNames() async {
    productNames.value = [];
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection(FireStoreCollections.newOrder)
        .where('status', isEqualTo: 'return')
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['status'] == "return") {
            returnOrderProductName.add(value.docs[i]['product']);
            productNames.value =
                LinkedHashSet<String>.from(returnOrderProductName).toList();
          } else {
            productNames.value = [];
          }
        }
      }
    });
  }

  Set serviceCustomerName = {};
  RxList serviceCustomerNames = [].obs;
  getPendingServiceCustomerNames() async {
    customerNames.value = [];

    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newService")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['serviceStatus'] == "pending") {
            serviceCustomerNames.add(value.docs[i]['serviceCustomerName']);
            customerNames.value =
                LinkedHashSet<String>.from(serviceCustomerNames).toList();
          } else {
            customerNames.value = [];
          }
        }
      }
    });
  }

  RxList completeServiceCustomerNames = [].obs;
  getCompleteServiceCustomerNames() async {
    customerNames.value = [];

    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newService")
        .where('serviceStatus', isEqualTo: 'complete')
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          if (value.docs[i]['serviceStatus'] == "complete") {
            completeServiceCustomerNames
                .add(value.docs[i]['serviceCustomerName']);
            customerNames.value =
                LinkedHashSet<String>.from(completeServiceCustomerNames)
                    .toList();
          } else {
            customerNames.value = [];
          }
        }
      }
    });
  }

  List productsData = [];
  productsDataRows({required List list, required BuildContext context}) {
    int i = 1;

    list.removeWhere(
        (element) => ["", null, false, 0].contains(element['product']));

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...list.map((e) {
              return productsDataRow(
                  e: e, i: i++, context: context, length: list.length);
            }),
          ]
        : <DataRow>[];
  }

  List pendingData = [];
  pendingOrderDataRows({required List list, required BuildContext context}) {
    int i = 1;
    pendingData = list.where((element) {
      return element['status'].contains("pending");
    }).toList();

    pendingSearchList.value = pendingData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['dueDate'].contains(orderController.val.value) ||
          element['deliverCancel'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...pendingData.map(
              (e) => pendingOrderDataRow(e: e, i: i++, context: context),
            ),
          ]
        : <DataRow>[
            ...pendingSearchList.map(
              (e) => pendingOrderDataRow(e: e, i: i++, context: context),
            ),
          ];
  }

  List deliveredData = [];
  deliveredDataRows({required List list}) {
    int i = 1;
    deliveredData = list.where((element) {
      return element['status'].contains("delivered");
    }).toList();

    deliveredSearchList.value = deliveredData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['deliveredDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...deliveredData.map(
              (e) => deliveredDataRow(e: e, i: i++),
            ),
          ]
        : <DataRow>[
            ...deliveredSearchList.map(
              (e) => deliveredDataRow(e: e, i: i++),
            ),
          ];
  }

  List returnOrderData = [];
  retuenOrderDataRows({required List list}) {
    int i = 1;
    returnOrderData = list.where((element) {
      return element['status'].contains("return");
    }).toList();

    returnSearchList.value = returnOrderData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['deliveredDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...returnOrderData.map(
              (e) => returnOrderDataRow(e: e, i: i++),
            ),
          ]
        : <DataRow>[
            ...returnSearchList.map(
              (e) => returnOrderDataRow(e: e, i: i++),
            ),
          ];
  }

  List completeServiceData = [];
  completeServiceDataRows({required List list}) {
    int i = 1;
    completeServiceData = list.where((element) {
      return element['serviceStatus'].contains('complete');
    }).toList();

    completeServiceList.value = completeServiceData.where(
      (element) {
        return element['serviceCustomerName']
                .contains(orderController.val.value) ||
            element['serviceDate'].contains(orderController.val.value) ||
            element['serviceRemark'].contains(orderController.val.value) ||
            element['serviceContactNumber'].contains(orderController.val.value);
      },
    ).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...completeServiceData.map(
              (e) {
                return completeServiceDataRow(e: e, i: i++);
              },
            ),
          ]
        : <DataRow>[
            ...completeServiceList.map((e) {
              return completeServiceDataRow(e: e, i: i++);
            }),
          ];
  }

  List pendingServiceData = [];
  pendingServiceDataRows({required List list, required BuildContext context}) {
    int i = 1;
    pendingServiceData = list.where((element) {
      return element['serviceStatus'].contains('pending');
    }).toList();

    pendingServiceList.value = pendingServiceData.where((element) {
      return element['serviceCustomerName']
              .contains(orderController.val.value) ||
          element['serviceRemark'].contains(orderController.val.value) ||
          element['serviceDate'].contains(orderController.val.value) ||
          element['serviceContactNumber'].contains(orderController.val.value);
    }).toList();

    list.where(
      (element) => element['serviceCustomer'],
    );

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...pendingServiceData.map(
              (e) => pendingServiceDataRow(e: e, i: i++, context: context),
            ),
          ]
        : <DataRow>[
            ...pendingServiceList.map(
              (e) => pendingServiceDataRow(e: e, i: i++, context: context),
            ),
          ];
  }

  // stream = FirebaseFirestore.instance
  //     .collection(FireStoreCollections.newOrder)
  //     .orderBy('orderDate')
  //     .snapshots()
  //     .obs;

  Rx<Stream> serviceStream = FirebaseFirestore.instance
      .collection(FireStoreCollections.newService)
      .orderBy('serviceDate')
      .snapshots()
      .obs;

  TextStyle columnTextStyle = appTextStyle(
      color: ColorRes.white, fontSize: 14, weight: FontWeight.w500);

  TextStyle rowTextStyle = appTextStyle(
      color: ColorRes.skyBlue, fontSize: 14, weight: FontWeight.w300);

  @override
  void onInit() {
    super.onInit();
    stream.value = FirebaseFirestore.instance
        .collection(FireStoreCollections.newOrder)
        .orderBy('orderDate')
        .snapshots();

    // getCustomerNames();
  }
}
