import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/complete_service_screen/complete_service_controller.dart';
import 'package:product_app/utils/string_res.dart';

class CompleteServiceScreen extends StatelessWidget {
  CompleteServiceScreen({super.key});

  final CompleteServiceController completeServiceController =
      Get.put(CompleteServiceController());

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
                title: StringRes.completeService,
                controller: completeServiceController.searchController,
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
                          style: completeServiceController.columnTextStyle,
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
                          style: completeServiceController.columnTextStyle,
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
                          style: completeServiceController.columnTextStyle,
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
                          style: completeServiceController.columnTextStyle,
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
                          style: completeServiceController.columnTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: completeServiceController.listOfRows
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Center(
                                child: Text(
                                  element["num"].toString(),
                                  style: completeServiceController.rowTextStyle,
                                ),
                              )), //Extracting from Map element the value
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["customer_name"],
                                style: completeServiceController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["service"],
                                style: completeServiceController.rowTextStyle,
                              ))),
                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["date"],
                                style: completeServiceController.rowTextStyle,
                              ))),

                              DataCell(element["divider"]),
                              DataCell(Center(
                                  child: Text(
                                element["contact_number"],
                                style: completeServiceController.rowTextStyle,
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
