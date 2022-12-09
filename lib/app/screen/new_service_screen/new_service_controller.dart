import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/common/snackbar.dart';
import 'package:product_app/app/globals/global.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/model/product_model.dart';
import 'package:product_app/app/notification/notification_model.dart';
import 'package:product_app/app/notification/notification_service.dart';
import 'package:product_app/app/service/user_service.dart';
import 'package:product_app/app/utils/firestore_collections.dart';
import 'package:product_app/app/utils/string_res.dart';

class NewServiceController extends GetxController implements GetxService {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> customerNameController =
      TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> remarkController = TextEditingController().obs;
  Rx<TextEditingController> contactNumberController =
      TextEditingController().obs;
  UserService userService = UserService();
  RxBool loader = false.obs;
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
    } else if (contactNumberController.value.text.length != 10) {
      errorContactNumber = "Please enter valid contact number";
    } else {
      errorContactNumber = "";
    }
  }

  bool validator() {
    customerNameVlidation();
    dateVlidation();
    remarkVlidation();
    contactNumberValidation();

    if (errorCustomerName == "" &&
        errorDate == "" &&
        errorRemark == "" &&
        errorContactNumber == "") {
      return true;
    }
    return false;
  }

  RxList<String> customerNames = <String>[].obs;

  String date = "";
  String month = "";
  String year = "";

  /// date onTap
  void dateOnTap({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            1998), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      date = pickedDate.toString().split(" ")[0].toString().split("-")[2];
      month = pickedDate.toString().split(" ")[0].toString().split("-")[1];
      year = pickedDate.toString().split(" ")[0].toString().split("-")[0];
      dateController.value.text = "$date/$month/$year";
    }
  }

  int id = 1;

  /// add button onTap
  void addOnTap() async {
    if (validator()) {
      loader.value = true;
      await userService.addNewService(
        NewServiceModel(
            serviceUid: Global.uid,
            serviceCustomerName: customerName.value,
            serviceDate: dateController.value.text,
            serviceRemark: remarkController.value.text,
            serviceContactNumber: contactNumberController.value.text,
            serviceStatus: "pending"),
      );

      // await FirebaseHelper.firebaseHelper.firebaseFirestore
      //     .collection(FireStoreCollections.newOrder)
      //     .get()
      //     .then((value) {
      //   for (int i = 0; i < value.docs.length; i++) {
      //     if (value.docs[i]['customerName'] == customerName.value) {
      //       print(value.docs[i].id);
      //       FirebaseHelper.firebaseHelper.firebaseFirestore
      //           .collection(FireStoreCollections.newOrder)
      //           .doc(value.docs[i].id)
      //           .update({
      //         "serviceUid": Global.uid,
      //         "serviceCustomerName": customerName.value,
      //         "serviceDate": dateController.value.text,
      //         "serviceRemark": remarkController.value.text,
      //         "serviceContactNumber": contactNumberController.value.text,
      //         "serviceStatus": "pending"
      //       });
      //     }
      //   }
      // });

      await FirebaseHelper.firebaseHelper.firebaseFirestore
          .collection("users")
          .get()
          .then((value) {
        if (value.docs.length.isEqual(0)) {
        } else {
          for (int i = 0; i < value.docs.length; i++) {
            if (value.docs[i].id != PrefService.getString(PrefKeys.uid)) {
              NotificationService.sendNotification(
                SendNotificationModel(
                  fcmTokens: [value.docs[i]['fcmToken']],
                  title: "Service",
                  body: "New Service added (${customerName.value})",
                ),
              );
            }
          }
        }
      });
      loader.value = false;
      customerName.value = StringRes.customerName.toLowerCase();
      dateController.value.clear();
      remarkController.value.clear();
      contactNumberController.value.clear();
    } else {
      if (errorCustomerName != "") {
        snakBar(title: StringRes.error, text: errorCustomerName);
      } else if (errorDate != "") {
        snakBar(title: StringRes.error, text: errorDate);
      } else if (errorRemark != "") {
        snakBar(title: StringRes.error, text: errorRemark);
      } else if (errorContactNumber != "") {
        snakBar(title: StringRes.error, text: errorContactNumber);
      }
    }
  }

  Set customerNameSet = {};
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

  @override
  void onInit() {
    super.onInit();
    getCustomerNames();
  }
}
