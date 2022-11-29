import 'package:flutter/material.dart';
import 'package:product_app/screen/home_screen/home_page_controller.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:product_app/utils/string_res.dart';

Widget verticalDivider = VerticalDivider(
  color: ColorRes.color9A9ABF,
  thickness: 1,
);

List<DataColumn> orderListColumnList = [
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.srNo,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.customerName,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.productName,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.orderDate,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.deliveryDate,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.contactNumberSmall,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
];

List<DataColumn> pendingOrderColumnList = [
  DataColumn(
    label: Text(
      StringRes.srNo,
      style: orderController.columnTextStyle,
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Text(
      StringRes.customerName,
      style: orderController.columnTextStyle,
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Text(
      StringRes.productName,
      style: orderController.columnTextStyle,
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Text(
      StringRes.orderDate,
      style: orderController.columnTextStyle,
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.dueDate,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Text(
      StringRes.deliverCancel,
      style: orderController.columnTextStyle,
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Text(
      StringRes.contactNumberSmall,
      style: orderController.columnTextStyle,
    ),
  ),
];

List<DataColumn> deliveredReturnColumnList = [
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.srNo,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.customerName,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.productName,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.orderDate,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.deliveredDate,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          StringRes.contactNumberSmall,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
];

List<DataColumn> serviceColumnList = [
  DataColumn(
    label: Expanded(
      child: Center(
        child: Text(
          StringRes.srNo,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Center(
        child: Text(
          StringRes.customerName,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Center(
        child: Text(
          StringRes.service,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Center(
        child: Text(
          StringRes.date,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
  DataColumn(label: verticalDivider),
  DataColumn(
    label: Expanded(
      child: Center(
        child: Text(
          StringRes.contactNumber,
          style: orderController.columnTextStyle,
        ),
      ),
    ),
  ),
];
