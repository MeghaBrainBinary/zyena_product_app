import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/globals/global.dart';
import 'package:product_app/model/product_model.dart';
import 'package:product_app/screen/home_screen/widgets/columnlists.dart';
import 'package:product_app/screen/order_list_screen/order_list_controller.dart';
import 'package:product_app/screen/order_list_screen/order_list_screen.dart';
import 'package:product_app/utils/approutes.dart';
import 'package:product_app/utils/firestore_collections.dart';
import 'package:product_app/utils/string_res.dart';

OrderController orderController = Get.put(OrderController());

class HomePageController extends GetxController implements GetxService {
  RxBool isLoad = false.obs;
  RxList<ProductModel> productList = (List<ProductModel>.of([])).obs;
  Rx<ProductModel> product = ProductModel().obs;
  Stream orderListStream = FirebaseFirestore.instance
      .collection(FireStoreCollections.users)
      .doc(Global.uid)
      .collection(FireStoreCollections.newOrder)
      .orderBy('id')
      .snapshots();

  @override
  void onInit() {
    // getProduct();

    super.onInit();
  }

  void newOrderOnTap() {
    Get.toNamed(
      AppRoutes.newOrderPage,
    );
  }

  void orderListOnTap() async {
    Get.to(OrderScreen(
      controller: orderController.orderListSearchController.value,
      columnList: orderListColumnList,
      title: StringRes.orderList,
      // stream: orderListStream,
    ));
  }

  void pendingOrderOnTap() {
    Get.to(OrderScreen(
      hintText: StringRes.searchPendingOrder,
      controller: orderController.pendingOrderSearchController.value,
      columnList: pendingOrderColumnList,
      title: StringRes.pendingOrder,
      // stream: orderListStream,
    ));
  }

  void deliveredOnTap() {
    Get.to(OrderScreen(
      hintText: StringRes.searchDeliveredOrder,
      controller: orderController.deliveredSearchController.value,
      columnList: deliveredReturnColumnList,
      title: StringRes.delivered,
      // stream: orderListStream,
    ));
  }

  void returnOrderOnTap() {
    Get.to(OrderScreen(
      hintText: StringRes.searchReturnOrder,
      controller: orderController.returnOrderSearchController.value,
      columnList: deliveredReturnColumnList,
      title: StringRes.returnOrder,
      // stream: orderListStream,
    ));
  }

  void newServiceOnTap() {
    Get.toNamed(
      AppRoutes.newServicePage,
    );
  }

  void pendingServiceOnTap() {
    Get.toNamed(
      AppRoutes.pendingServicePage,
    );
  }

  void completeServiceOnTap() {
    Get.toNamed(
      AppRoutes.completeServicePage,
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
      value.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        ProductModel productModel = ProductModel.fromMap(map);
        productList.add(productModel);
      });
    });
    isLoad.value = false;
  }

  onChange(ProductModel model) {
    product.value = model;
    print(model);
  }
}
