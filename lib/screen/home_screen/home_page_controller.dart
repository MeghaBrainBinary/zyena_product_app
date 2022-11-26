import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/model/product_model.dart';
import 'package:product_app/utils/approutes.dart';

class HomePageController extends GetxController implements GetxService {
  RxBool isLoad = false.obs;
  RxList<ProductModel> productList = (List<ProductModel>.of([])).obs;
  Rx<ProductModel> product = ProductModel().obs;

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

  void orderListOnTap() {
    Get.toNamed(
      AppRoutes.orderListPage,
    );
  }

  void pendingOrderOnTap() {
    Get.toNamed(
      AppRoutes.pendingOrderPage,
    );
  }

  void deliveredOnTap() {
    Get.toNamed(
      AppRoutes.deliveredPage,
    );
  }

  void returnOrderOnTap() {
    Get.toNamed(
      AppRoutes.returnOrderPage,
    );
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
