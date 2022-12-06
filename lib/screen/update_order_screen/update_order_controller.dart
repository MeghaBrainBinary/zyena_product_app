import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/common/snackbar.dart';
import 'package:product_app/screen/order_screen/order_controller.dart';
import 'package:product_app/screen/order_screen/order_screen.dart';
import 'package:product_app/screen/order_screen/widgets/column_lists.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/firestore_collections.dart';
import 'package:product_app/utils/string_res.dart';

class UpdateOrderController extends GetxController implements GetxService {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> customerNameController =
      TextEditingController().obs;
  Rx<TextEditingController> orderDateController = TextEditingController().obs;
  Rx<TextEditingController> expirationController = TextEditingController().obs;
  Rx<TextEditingController> contactNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> productNameController = TextEditingController().obs;
  RxString selectProduct = StringRes.selectProduct.obs;
  RxString customerName = StringRes.customerName.toLowerCase().obs;

  DateTime? pickedOrderDate;
  String date = "";
  String month = "";
  String year = "";
  RxBool loader = false.obs;
  RxBool load = false.obs;
  UserService userService = UserService();

  String errorCustomerName = "";
  String errorProductName = "";
  String errorOrderDate = "";
  String errorExpirationDate = "";
  String errorContactNumber = "";

  void customerNameVlidation() {
    if (customerName.value == StringRes.customerName.toLowerCase()) {
      errorCustomerName = "Please enter customer name";
    } else {
      errorCustomerName = "";
    }
  }

  void productVlidation() {
    if (selectProduct.value == StringRes.selectProduct) {
      errorProductName = "Please enter product";
    } else {
      errorProductName = "";
    }
  }

  void orderDateValidation() {
    if (orderDateController.value.text == "") {
      errorOrderDate = "Please enter order date";
    } else {
      errorOrderDate = "";
    }
  }

  void expirationDateValidation() {
    if (expirationController.value.text == "") {
      errorExpirationDate = "Please enter expiration date";
    } else {
      errorExpirationDate = "";
    }
  }

  void contactNumberValidation() {
    if (contactNumberController.value.text == "") {
      errorContactNumber = "Please enter contact number";
    } else if (contactNumberController.value.text.length != 10) {
      errorContactNumber = "Please enter valid contact number";
    } else {
      errorContactNumber = "";
    }
  }

  bool validator() {
    customerNameVlidation();
    productVlidation();
    orderDateValidation();
    expirationDateValidation();
    contactNumberValidation();

    if (errorCustomerName == "" &&
        errorProductName == "" &&
        errorOrderDate == "" &&
        errorExpirationDate == "" &&
        errorContactNumber == "") {
      return true;
    }
    return false;
  }

  int id = 1;

  void addCustomerNameOnTap() {
    customerName.value = customerNameController.value.text;
    Get.back();
  }

  RxList<String> customerNames = <String>[].obs;

  /// add button on tap
  addOnTap({required dynamic val, required String id}) async {
    if (validator()) {
      loader.value = true;
      print("================================");
      print(id);
      print("================================");
      await FirebaseHelper.firebaseHelper.firebaseFirestore
          .collection(FireStoreCollections.newOrder)
          .doc(id)
          .update({
        // "uid": Global.uid,
        "customerName": customerName.value,
        "product": selectProduct.value,
        "orderDate": orderDateController.value.text,
        "expirationDate": expirationController.value.text,
        "contactNumber": contactNumberController.value.text,
        "status": "pending",
        "deliverCancel": "Deliver",
        "deliveredDate": "00/00/0000",
        "dueDate": "00/00/0000",
      });

      loader.value = false;
      Get.to(OrderScreen(
        controller: orderController.orderListSearchController.value,
        columnList: orderListColumnList,
        title: StringRes.orderList,
        stream: orderController.stream.value,
      ));
    } else {
      if (errorCustomerName != "") {
        snakBar(title: StringRes.error, text: errorCustomerName);
      } else if (errorProductName != "") {
        snakBar(title: StringRes.error, text: errorProductName);
      } else if (errorExpirationDate != "") {
        snakBar(title: StringRes.error, text: errorExpirationDate);
      } else if (errorContactNumber != "") {
        snakBar(title: StringRes.error, text: errorContactNumber);
      }
    }
  }

  /// order date on tap
  void orderDateOnTap({required BuildContext context}) async {
    pickedOrderDate = await showDatePicker(
        context: context,
        selectableDayPredicate: (day) {
          return true;
        },
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            1998), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedOrderDate != null) {
      date = pickedOrderDate.toString().split(" ")[0].toString().split("-")[2];
      month = pickedOrderDate.toString().split(" ")[0].toString().split("-")[1];
      year = pickedOrderDate.toString().split(" ")[0].toString().split("-")[0];
      orderDateController.value.text = "$date/$month/$year";
    }
  }

  /// expiration date on tap
  void expirationDateOnTap({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      selectableDayPredicate: (day) {
        return true;
      },
      context: context,
      initialDate: (pickedOrderDate != null)
          ? pickedOrderDate!.add(const Duration(days: 1))
          : DateTime.now().add(const Duration(days: 1)), //get today's date
      firstDate: (pickedOrderDate != null)
          ? pickedOrderDate!.add(const Duration(days: 1))
          : DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      date = pickedDate.toString().split(" ")[0].toString().split("-")[2];
      month = pickedDate.toString().split(" ")[0].toString().split("-")[1];
      year = pickedDate.toString().split(" ")[0].toString().split("-")[0];
      expirationController.value.text = "$date/$month/$year";
    }
  }

  RxList<String> products = <String>[].obs;

  getCustomerNames() async {
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          customerNames.add(value.docs[i]['customerName']);
        }
      }
    });
  }

  getProducts() async {
    await FirebaseHelper.firebaseHelper.firebaseFirestore
        .collection("newOrder")
        .get()
        .then((value) {
      if (value.docs.length.isEqual(0)) {
      } else {
        for (int i = 0; i < value.docs.length; i++) {
          products.add(value.docs[i]['product']);
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getCustomerNames();
    getProducts();
  }
}
