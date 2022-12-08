import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/utils/firestore_collections.dart';

Widget verticalDivider = VerticalDivider(
  color: ColorRes.color9A9ABF,
  thickness: 0.5,
);

Widget dataTable(
    {required BuildContext context,
    required List<DataColumn> columns,
    required List<DataRow> rows}) {
  // FirebaseFirestore.instance
  //     .collection(FireStoreCollections.newOrder)
  //     .get()
  //     .then(
  //   (value) {
  //     if (value.docs.length.isEqual(0)) {
  //     } else {
  //       for (int i = 0; i < value.docs.length; i++) {
  //         if (value.docs[i]['status'] == "cancel") {
  //           orderController.present.value = true;
  //         } else {
  //           orderController.present.value = false;
  //         }
  //       }
  //     }
  //   },

  // );

  return ScrollConfiguration(
    behavior: const ScrollBehavior().copyWith(overscroll: false),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data:
                Theme.of(context).copyWith(dividerColor: ColorRes.color9A9ABF),
            child: DataTable(
                decoration: BoxDecoration(
                    // color: Colors.red.withOpacity(0.2),
                    // border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.grey.shade300)
                    ]),
                dataRowHeight: Get.height * 0.055,
                columnSpacing: 0,
                // border: TableBorder(
                //     horizontalInside: (orderController.present.value)
                //         ? BorderSide(
                //             width: 0.5,
                //             color: (orderController.present.value)
                //                 ? Colors.red
                //                 : Colors.black,
                //             style: BorderStyle.solid)
                //         : BorderSide.none),
                horizontalMargin: 5,
                dividerThickness: 0.0,
                dataRowColor:
                    MaterialStateColor.resolveWith((states) => ColorRes.white),
                headingRowHeight: Get.height * 0.055,
                headingTextStyle: appTextStyle(
                    color: ColorRes.white,
                    fontSize: 14,
                    weight: FontWeight.w500),
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => ColorRes.skyBlue),
                columns: columns,
                rows: rows),
          ),
        ],
      ),
    ),
  );
}
