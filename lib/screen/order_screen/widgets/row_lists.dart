import 'package:flutter/material.dart';
import 'package:product_app/screen/home_screen/home_page_controller.dart';
import 'package:product_app/screen/new_order_screen/new_order_controller.dart';
import 'package:product_app/screen/order_screen/widgets/customer_popup.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/firestore_collections.dart';
import 'package:product_app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

NewOrderController newOrderController = Get.put(NewOrderController());

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
      DataCell(
        Center(
          child: Text(
            "${e['contactNumber']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
    ],
  );
}

DataRow customersDataRow(
    {required dynamic e, required int i, required BuildContext context}) {
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
      DataCell(onTap: () {
        newOrderController.customerNameUpdateController.value.text =
            e['customerName'];
        popup(
            context: context,
            title: StringRes.customerName.toString().split(" ")[0],
            hintText: StringRes.customerName.toLowerCase(),
            controller: newOrderController.customerNameUpdateController.value,
            onTap: () async {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              newOrderController.load.value = true;
              await FirebaseHelper.firebaseHelper.firebaseFirestore
                  .collection(FireStoreCollections.newOrder)
                  .doc("${e.id}")
                  .update({
                "customerName":
                    newOrderController.customerNameUpdateController.value.text,
              });
              newOrderController.load.value = false;
              Get.back();
            });
      },
          Center(
              child: Text(
            StringRes.edit,
            style: orderController.rowTextStyle,
          ))),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(onTap: () async {
        newOrderController.load.value = true;
        await FirebaseHelper.firebaseHelper.firebaseFirestore
            .collection(FireStoreCollections.newOrder)
            .doc("${e.id}")
            .update({
          "customerName": "",
        });
        newOrderController.load.value = false;
      },
          Center(
              child: Text(
            StringRes.delete,
            style: orderController.rowTextStyle,
          ))),
    ],
  );
}

DataRow productsDataRow(
    {required dynamic e,
    required int i,
    required BuildContext context,
    required int length}) {
  FirebaseFirestore.instance
      .collection(FireStoreCollections.newOrder)
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      if (value.docs.contains(value.docs[i]['product'])) {
        print('product e ==> ${e['product']}');
      }
    }
  });

  return DataRow(
    cells: <DataCell>[
      DataCell(
        Center(
          child: Text(
            "$i",
            style: orderController.rowTextStyle,
          ),
        ),
      ), //Extracting from Map element the value
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        Center(
          child: Text(
            "${e['product']}",
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        onTap: () {
          newOrderController.productNameUpdateController.value.text =
              e['product'];
          popup(
              context: context,
              title: StringRes.product.toString().split(" ")[0],
              hintText: StringRes.product.toLowerCase(),
              controller: newOrderController.productNameUpdateController.value,
              onTap: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                newOrderController.load.value = true;
                await FirebaseHelper.firebaseHelper.firebaseFirestore
                    .collection(FireStoreCollections.newOrder)
                    .doc("${e.id}")
                    .update({
                  "product":
                      newOrderController.productNameUpdateController.value.text,
                });
                newOrderController.load.value = false;
                Get.back();
              });
        },
        Center(
          child: Text(
            StringRes.edit,
            style: orderController.rowTextStyle,
          ),
        ),
      ),
      DataCell(
        orderController.verticalDivider,
      ),
      DataCell(
        onTap: () async {
          newOrderController.load.value = true;
          await FirebaseFirestore.instance
              .collection(FireStoreCollections.newOrder)
              .doc("${e.id}")
              .update({
            "product": "",
          });
          newOrderController.load.value = false;
        },
        Center(
          child: Text(
            StringRes.delete,
            style: orderController.rowTextStyle,
          ),
        ),
      ),
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

DataRow proDataRow() {
  return const DataRow(cells: <DataCell>[
    DataCell(
      Center(
        child: Text("1"),
      ),
    ),
    DataCell(
      Center(
        child: Text("products"),
      ),
    ),
  ]);
}

DataRow returnOrderDataRow({required dynamic e, required int i}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Center(
          child: Text(
        "$i",
        style: orderController.rowTextStyle,
      ))), //Extracting from Map element the value
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['customerName']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['product']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['orderDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
      DataCell(Center(
          child: Text(
        "${e['deliveredDate']}",
        style: orderController.rowTextStyle,
      ))),
      DataCell(orderController.verticalDivider),
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
