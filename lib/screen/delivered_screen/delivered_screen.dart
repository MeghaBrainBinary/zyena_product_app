import 'package:flutter/material.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/delivered_screen/delivered_controller.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/utils/string_res.dart';
import 'package:get/get.dart';

class DeliveredScreen extends StatelessWidget {
  DeliveredScreen({super.key});

  final DeliveredController deliveredController =
      Get.put(DeliveredController());

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
                hintText: StringRes.searchDeliveredOrder,
                title: StringRes.delivered,
                controller: deliveredController.searchController,
              ),
            ),
            Expanded(
              child: dataTable(
                context: context,
                columns: [
                  DataColumn(
                    label: Text(
                      StringRes.srNo,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.customerName,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.productName,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.orderDate,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.deliveredDate,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                  DataColumn(label: verticalDivider),
                  DataColumn(
                    label: Text(
                      StringRes.contactNumberSmall,
                      style: deliveredController.columnTextStyle,
                    ),
                  ),
                ],
                rows: deliveredController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: deliveredController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: deliveredController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["product_name"],
                                style: deliveredController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["order_date"],
                                style: deliveredController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["delivered_date"],
                                style: deliveredController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: deliveredController.rowTextStyle,
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
