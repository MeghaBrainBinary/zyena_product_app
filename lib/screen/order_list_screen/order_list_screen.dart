import 'package:flutter/material.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/order_list_screen/order_list_controller.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/utils/string_res.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({super.key});

  final OrderListController orderListController =
      Get.put(OrderListController());

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
                title: StringRes.orderList,
                controller: orderListController.searchController,
              ),
            ),
            Expanded(
              child: dataTable(
                context: context,
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          StringRes.srNo,
                          style: orderListController.columnTextStyle,
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
                          style: orderListController.columnTextStyle,
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
                          style: orderListController.columnTextStyle,
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
                          style: orderListController.columnTextStyle,
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
                          style: orderListController.columnTextStyle,
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
                          style: orderListController.columnTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: orderListController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: orderListController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: orderListController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["product_name"],
                                style: orderListController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["order_date"],
                                style: orderListController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["delivery_date"],
                                style: orderListController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: orderListController.rowTextStyle,
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
