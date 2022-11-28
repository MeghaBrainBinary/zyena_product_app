import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_app/utils/string_res.dart';

class NewServiceController extends GetxController implements GetxService {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> customerNameController =
      TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> remarkController = TextEditingController().obs;
  Rx<TextEditingController> contactNumberController =
      TextEditingController().obs;

  RxString customerName = StringRes.customerName.toLowerCase().obs;

  String errorCustomerName = "";
  String errorDate = "";
  String errorRemark = "";
  String errorContactNumber = "";

  void customerNameVlidation() {
    if (customerName.value == StringRes.customerName.toLowerCase()) {
      errorCustomerName = "Please enter customer name";
    } else {
      errorCustomerName = "";
    }
  }

  void dateVlidation() {
    if (dateController.value.text.isEmpty) {
      errorCustomerName = "Please enter date";
    } else {
      errorCustomerName = "";
    }
  }

  void remarkVlidation() {
    if (remarkController.value.text.isEmpty) {
      errorCustomerName = "Please enter remark";
    } else {
      errorCustomerName = "";
    }
  }

  void contactNumberValidation() {
    if (contactNumberController.value.text == "") {
      errorContactNumber = "Please enter contact number";
    } else {
      errorContactNumber = "";
    }
  }

  List<String> customerNames = [
    "name",
    "name-1",
    "name-2",
    "name-3",
    "name-4",
    "name-5",
  ];

  /// add button onTap
  void addOnTap() {}
}
