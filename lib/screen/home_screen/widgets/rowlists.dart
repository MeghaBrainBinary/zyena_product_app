import 'package:flutter/material.dart';
import 'package:product_app/screen/home_screen/home_page_controller.dart';

orderListDataRows({required List list}) {
  int i = 1;

  orderController.orderListData.value = list.where((element) {
    return element['customerName'].contains(orderController.val.value) ||
        element['product'].contains(orderController.val.value);
  }).toList();
  orderController.update(['ol']);
  orderController.update();
  print("-=-=========----------------=========------------");
  print(orderController.val.value);
  return <DataRow>[
    ...list
        .map((e) => DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text(
                    "${i++}",
                    style: orderController.rowTextStyle,
                  ),
                )), //Extracting from Map element the value
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['customerName']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['product']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['orderDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['expirationDate']}",
                  style: orderController.rowTextStyle,
                ))),

                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['contactNumber']}",
                  style: orderController.rowTextStyle,
                ))),
              ],
            ))
        .toList(),
  ];
}

List pendingData = [];
pendingOrderDataRows({required List list}) {
  pendingData = list.where((element) {
    return element['status'].contains("pending");
  }).toList();
  int i = 1;
  return <DataRow>[
    ...pendingData
        .map((e) => DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text(
                    "${i++}",
                    style: orderController.rowTextStyle,
                  ),
                )), //Extracting from Map element the value
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['customerName']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['product']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['orderDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['dueDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['deliverCancel']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['contactNumber']}",
                  style: orderController.rowTextStyle,
                ))),
              ],
            ))
        .toList(),
  ];
}

List deliveredData = [];
deliveredDataRows({required List list}) {
  deliveredData = list.where((element) {
    return element['status'].contains("delivered");
  }).toList();
  int i = 1;
  return <DataRow>[
    ...deliveredData
        .map((e) => DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text(
                    "${i++}",
                    style: orderController.rowTextStyle,
                  ),
                )), //Extracting from Map element the value
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['customerName']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['product']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['orderDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),

                DataCell(Center(
                    child: Text(
                  "${e['deliveredDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['contactNumber']}",
                  style: orderController.rowTextStyle,
                ))),
              ],
            ))
        .toList(),
  ];
}

List returnOrderData = [];
retuenOrderDataRows({required List list}) {
  returnOrderData = list.where((element) {
    return element['status'].contains("return");
  }).toList();
  int i = 1;
  return <DataRow>[
    ...returnOrderData
        .map((e) => DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text(
                    "${i++}",
                    style: orderController.rowTextStyle,
                  ),
                )), //Extracting from Map element the value
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['customerName']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['product']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['orderDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),

                DataCell(Center(
                    child: Text(
                  "${e['deliveredDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['contactNumber']}",
                  style: orderController.rowTextStyle,
                ))),
              ],
            ))
        .toList(),
  ];
}

List pendingServiceData = [];
pendingServiceDataRows({required List list}) {
  int id = 1;

  return <DataRow>[
    ...list.map((e) {
      return DataRow(cells: <DataCell>[
        DataCell(
          Expanded(
            child: Center(
              child: Text("${id++}"),
            ),
          ),
        ),
        DataCell(orderController.verticalDivider),
        DataCell(
          Expanded(
            child: Center(
              child: Text(
                "${e['serviceCustomerName']}",
                style: orderController.rowTextStyle,
              ),
            ),
          ),
        ),
        DataCell(orderController.verticalDivider),
        DataCell(
          Expanded(
            child: Center(
              child: Text(
                "${e['serviceRemark']}",
                style: orderController.rowTextStyle,
              ),
            ),
          ),
        ),
        DataCell(orderController.verticalDivider),
        DataCell(
          Expanded(
            child: Center(
              child: Text(
                "${e['serviceDate']}",
                style: orderController.rowTextStyle,
              ),
            ),
          ),
        ),
        DataCell(orderController.verticalDivider),
        DataCell(
          Expanded(
            child: Center(
              child: Text(
                "${e['serviceContactNumber']}",
                style: orderController.rowTextStyle,
              ),
            ),
          ),
        ),
      ]);
    }),
  ];
}

List completeServiceData = [];
completeServiceDataRows({required List list}) {
  completeServiceData = list.where((element) {
    return element['serviceStatus'].contains("complete");
  }).toList();
  int i = 1;
  return <DataRow>[
    ...completeServiceData
        .map((e) => DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text(
                    "${i++}",
                    style: orderController.rowTextStyle,
                  ),
                )), //Extracting from Map element the value
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['serviceCustomerName']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['serviceRemark']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['serviceDate']}",
                  style: orderController.rowTextStyle,
                ))),
                DataCell(
                  orderController.verticalDivider,
                ),
                DataCell(Center(
                    child: Text(
                  "${e['serviceContactNumber']}",
                  style: orderController.rowTextStyle,
                ))),
              ],
            ))
        .toList(),
  ];
}
