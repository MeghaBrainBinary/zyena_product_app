import 'package:flutter/material.dart';
import 'package:product_app/screen/home_screen/home_page_controller.dart';

DataRow orderListDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
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
  );
}

DataRow pendingOrderDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
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
  );
}

DataRow deliveredDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
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
  );
}

DataRow returnOrderDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
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
  );
}

DataRow pendingServiceDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
        child: Text(
          "$i",
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
  );
}

DataRow completeServiceDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(
        Center(
          child: Text(
            "$i",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceCustomerName']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceRemark']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceDate']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(orderController.verticalDivider),
      DataCell(
        Center(
          child: Text(
            "${e['serviceContactNumber']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
    ],
  );
}
