import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/common/button.dart';
import 'package:product_app/common/sizedbox.dart';
import 'package:product_app/common/snackbar.dart';
import 'package:product_app/common/title_with_textfield.dart';
import 'package:product_app/model/product_model.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

class NewOrderController extends GetxController implements GetxService {
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

  /// add button on tap
  addOnTap() async {
    if (validator()) {
      loader.value = true;
      await userService.addNewOrder(NewOrderModel(
        id: "${id++}",
        customerName: customerName.value,
        product: selectProduct.value,
        orderDate: orderDateController.value.text,
        expirationDate: expirationController.value.text,
        contactNumber: contactNumberController.value.text,
        status: "pending",
        deliverCancel: "Deliver",
        deliveredDate: "00/00/0000",
        dueDate: "00/00/0000",
      ));

      loader.value = false;
      customerName.value = StringRes.customerName.toLowerCase();
      selectProduct.value = StringRes.selectProduct;
      orderDateController.value.clear();
      expirationController.value.clear();
      contactNumberController.value.clear();
    } else {
      if (errorCustomerName != "") {
        snakBar(title: StringRes.error, text: errorCustomerName);
      } else if (errorProductName != "") {
        snakBar(title: StringRes.error, text: errorProductName);
      } else if (errorOrderDate != "") {
        snakBar(title: StringRes.error, text: errorOrderDate);
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
    if (pickedOrderDate != null) {
      DateTime? pickedDate = await showDatePicker(
          selectableDayPredicate: (day) {
            return true;
          },
          context: context,
          initialDate: DateTime.now(), //get today's date
          firstDate: DateTime(
              1998), //DateTime.now() - not to allow to choose before today.
          lastDate: pickedOrderDate!.subtract(const Duration(days: 1)));
      if (pickedDate != null) {
        date = pickedDate.toString().split(" ")[0].toString().split("-")[2];
        month = pickedDate.toString().split(" ")[0].toString().split("-")[1];
        year = pickedDate.toString().split(" ")[0].toString().split("-")[0];
        expirationController.value.text = "$date/$month/$year";
      }
    } else {
      snakBar(title: StringRes.error, text: "Please select order date first");
    }
  }

  List<String> products = [
    "product",
    "product-1",
    "product-2",
    "product-3",
    "product-4",
    "product-5",
  ];

  List<String> customerNames = [
    "name",
    "name-1",
    "name-2",
    "name-3",
    "name-4",
    "name-5",
  ];

  /// product plus button onTap
  void productPlusOnTap({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      barrierColor: ColorRes.black.withOpacity(0.65),
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                            controller: productNameController),
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
                          selectProduct.value =
                              productNameController.value.text;
                          Get.back();
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  /// customer name plus button onTap
  void customerNamePlusOnTap({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      barrierColor: ColorRes.black.withOpacity(0.65),
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                          "${StringRes.add} ${StringRes.customerName.toString().split(" ")[0]}",
                          style: appTextStyle(
                              color: ColorRes.skyBlue,
                              fontSize: 20,
                              weight: FontWeight.w500),
                        ),
                        sizedBoxHeight(height: 0.03),
                        titleWithTextField(
                            title:
                                StringRes.customerName.toString().split(" ")[0],
                            hintText: StringRes.customerName.toLowerCase(),
                            controller: customerNameController),
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
                          customerName.value =
                              customerNameController.value.text;
                          Get.back();
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
