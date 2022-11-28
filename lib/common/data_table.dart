import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';

Widget verticalDivider = VerticalDivider(
  color: ColorRes.color9A9ABF,
  thickness: 0.5,
);

Widget dataTable(
    {required BuildContext context,
    required List<DataColumn> columns,
    required List<DataRow> rows}) {
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
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Colors.grey.shade300)
                ]),
                dataRowHeight: Get.height * 0.055,
                columnSpacing: 1,
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
