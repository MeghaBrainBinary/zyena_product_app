import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/screen/order_screen/widgets/row_lists.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/utils/firestore_collections.dart';

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

  RxString val = "".obs;
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

  orderListDataRows({required List list}) {
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
              (e) => orderListDataRow(e: e, i: i++),
            ),
          ]
        : <DataRow>[
            ...orderController.orderListData.map(
              (e) => orderListDataRow(e: e, i: i++),
            ),
          ];
  }

  List pendingData = [];
  pendingOrderDataRows({required List list}) {
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
              (e) => pendingOrderDataRow(e: e, i: i++),
            ),
          ]
        : <DataRow>[
            ...pendingSearchList.map(
              (e) => pendingOrderDataRow(e: e, i: i++),
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
  pendingServiceDataRows({required List list}) {
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

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
            ...pendingServiceData.map(
              (e) => pendingServiceDataRow(e: e, i: i++),
            ),
          ]
        : <DataRow>[
            ...pendingServiceList.map(
              (e) => pendingServiceDataRow(e: e, i: i++),
            ),
          ];
  }

  Stream stream = FirebaseFirestore.instance
      .collection(FireStoreCollections.newOrder)
      .orderBy('orderDate')
      .snapshots();

  Stream serviceStream = FirebaseFirestore.instance
      .collection(FireStoreCollections.newService)
      .orderBy('serviceDate')
      .snapshots();

  TextStyle columnTextStyle = appTextStyle(
      color: ColorRes.white, fontSize: 14, weight: FontWeight.w500);

  TextStyle rowTextStyle = appTextStyle(
      color: ColorRes.skyBlue, fontSize: 14, weight: FontWeight.w300);
}
