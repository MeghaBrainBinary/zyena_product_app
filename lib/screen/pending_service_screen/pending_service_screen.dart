import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/pending_service_screen/pending_service_controller.dart';
import 'package:product_app/utils/string_res.dart';

class PendingServiceScreen extends StatelessWidget {
  PendingServiceScreen({super.key});

  final PendingServiceController pendingServiceController =
      Get.put(PendingServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            // Expanded(
            //   flex: 0,
            //   child: searchBar(
            //       title: StringRes.pendingService,
            //       controller: pendingServiceController.searchController),
            // ),
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
                          style: pendingServiceController.columnTextStyle,
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
                          style: pendingServiceController.columnTextStyle,
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
                          StringRes.service,
                          style: pendingServiceController.columnTextStyle,
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
                          StringRes.date,
                          style: pendingServiceController.columnTextStyle,
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
                          style: pendingServiceController.columnTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: pendingServiceController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: pendingServiceController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: pendingServiceController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["service"],
                                style: pendingServiceController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["date"],
                                style: pendingServiceController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: pendingServiceController.rowTextStyle,
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
