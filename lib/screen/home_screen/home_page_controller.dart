// ignore: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/model/product_model.dart';
import 'package:product_app/screen/order_screen/order_controller.dart';
import 'package:product_app/screen/order_screen/order_screen.dart';
import 'package:product_app/screen/order_screen/widgets/column_lists.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/string_res.dart';

OrderController orderController = Get.put(OrderController());

class HomePageController extends GetxController implements GetxService {
  RxBool isLoad = false.obs;
  RxList<ProductModel> productList = (List<ProductModel>.of([])).obs;
  Rx<ProductModel> product = ProductModel().obs;

  void newOrderOnTap({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      AppRoutes.newOrderPage,
    );
  }

  void orderListOnTap() async {
    Get.to(OrderScreen(
      controller: orderController.orderListSearchController.value,
      columnList: orderListColumnList,
      title: StringRes.orderList,
      stream: orderController.stream,
    ));
  }

  void pendingOrderOnTap() {
    Get.to(
      OrderScreen(
        hintText: StringRes.searchPendingOrder,
        controller: orderController.pendingOrderSearchController.value,
        columnList: pendingOrderColumnList,
        title: StringRes.pendingOrder,
        stream: orderController.stream,
      ),
    );
  }

  void deliveredOnTap() {
    Get.to(
      OrderScreen(
        hintText: StringRes.searchDeliveredOrder,
        controller: orderController.deliveredSearchController.value,
        columnList: deliveredReturnColumnList,
        title: StringRes.delivered,
        stream: orderController.stream,
      ),
    );
  }

  /// return order onTap
  void returnOrderOnTap() {
    Get.to(
      OrderScreen(
        hintText: StringRes.searchReturnOrder,
        controller: orderController.returnOrderSearchController.value,
        columnList: deliveredReturnColumnList,
        title: StringRes.returnOrder,
        stream: orderController.stream,
      ),
    );
  }

  /// new service onTap
  void newServiceOnTap() {
    Get.toNamed(
      AppRoutes.newServicePage,
    );
  }

  /// pending service onTap
  void pendingServiceOnTap() {
    Get.to(
      OrderScreen(
        controller: orderController.pendingServiceController.value,
        columnList: serviceColumnList,
        title: StringRes.pendingService,
        stream: orderController.serviceStream,
      ),
    );
  }

  ///customersOnTap
  void customersOnTap() {
    Get.to(
      OrderScreen(
        controller: orderController.pendingServiceController.value,
        columnList: customersColumnList,
        title: StringRes.customers,
        stream: orderController.stream,
      ),
    );
  }

  /// productsOnTap
  void productsOnTap() {
    Get.to(
      OrderScreen(
        controller: orderController.pendingServiceController.value,
        columnList: productColumnList,
        title: StringRes.products,
        stream: orderController.stream,
      ),
    );
  }

  /// complete service onTap
  void completeServiceOnTap() {
    Get.to(
      OrderScreen(
        controller: orderController.completeServiceController.value,
        columnList: serviceColumnList,
        title: StringRes.completeService,
        stream: orderController.serviceStream,
      ),
    );
  }

  getProduct() async {
    productList = (List<ProductModel>.of([])).obs;
    isLoad.value = true;
    await FirebaseFirestore.instance
        .collection("product")
        .orderBy(
          "id",
        )
        .get()
        .then((value) {
      // ignore: avoid_function_literals_in_foreach_calls
      value.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        ProductModel productModel = ProductModel.fromMap(map);
        productList.add(productModel);
      });
    });
    isLoad.value = false;
  }

  // onChange(ProductModel model) {
  //   product.value = model;
  //   print(model);
  // }
}
