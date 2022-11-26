import 'package:flutter/material.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/delivered_screen/delivered_controller.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/screen/return_order_screen/return_order_controller.dart';
import 'package:product_app/utils/string_res.dart';
import 'package:get/get.dart';

class ReturnOrderScreen extends StatelessWidget {
  ReturnOrderScreen({super.key});

  final ReturnOrderController returnOrderController =
      Get.put(ReturnOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: searchBar(
                hintText: StringRes.searchReturnOrder,
                title: StringRes.returnOrder,
                controller: returnOrderController.searchController,
              ),
            ),
            Expanded(
              child: dataTable(
                context: context,
                columns: [
                  DataColumn(
                    label: Text(
                      StringRes.srNo,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.customerName,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.productName,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.orderDate,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.deliveredDate,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.contactNumberSmall,
                      style: returnOrderController.columnTextStyle,
                    ),
                  ),
                ],
                rows: returnOrderController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: returnOrderController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: returnOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["product_name"],
                                style: returnOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["order_date"],
                                style: returnOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["delivered_date"],
                                style: returnOrderController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: returnOrderController.rowTextStyle,
                              ))),
                            ],
                          )),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
