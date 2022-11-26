import 'package:flutter/material.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/screen/pending_order_screen/pending_order_controller.dart';
import 'package:product_app/utils/string_res.dart';
import 'package:get/get.dart';

class PendingOrderScreen extends StatelessWidget {
  PendingOrderScreen({super.key});

  PendingOrderController pendingOrderController =
      Get.put(PendingOrderController());

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
                hintText: StringRes.searchPendingOrder,
                title: StringRes.pendingOrder,
                controller: pendingOrderController.searchController,
              ),
            ),
            Expanded(
              child: dataTable(
                context: context,
                columns: [
                  DataColumn(
                    label: Text(
                      StringRes.srNo,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.customerName,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.productName,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.orderDate,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.dueDate,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.deliverCancel,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.contactNumberSmall,
                      style: pendingOrderController.columnTextStyle,
                    ),
                  ),
                ],
                rows: pendingOrderController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: pendingOrderController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: pendingOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["product_name"],
                                style: pendingOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["order_date"],
                                style: pendingOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["due_date"],
                                style: pendingOrderController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["deliver/cancel"],
                                style: pendingOrderController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: pendingOrderController.rowTextStyle,
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
