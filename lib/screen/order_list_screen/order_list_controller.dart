import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/globals/global.dart';
import 'package:product_app/screen/home_screen/widgets/rowlists.dart';
import 'package:product_app/service/user_service.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/utils/firestore_collections.dart';
import 'package:product_app/utils/string_res.dart';

OrderController orderController = Get.put(OrderController());

class OrderController extends GetxController implements GetxService {
  Rx<TextEditingController> orderListSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> pendingOrderSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> deliveredSearchController =
      TextEditingController().obs;
  Rx<TextEditingController> returnOrderSearchController =
      TextEditingController().obs;
  RxString val = "".obs;
  Widget verticalDivider = VerticalDivider(
    color: ColorRes.color9A9ABF,
    thickness: 1,
  );
  RxList orderListData = [].obs;
  RxList pendingSearchList = [].obs;
  RxList deliveredSearchList = [].obs;
  RxList returnSearchList = [].obs;

  orderListDataRows({required List list}) {
    int i = 1;

    orderController.orderListData.value = list.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['deliveryDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
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
          ]
        : <DataRow>[
            ...orderController.orderListData.value
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
    pendingSearchList.value = pendingData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['dueDate'].contains(orderController.val.value) ||
          element['deliverCancel'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
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
          ]
        : <DataRow>[
            ...pendingSearchList
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
    deliveredSearchList.value = deliveredData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['deliveredDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
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
          ]
        : <DataRow>[
            ...deliveredSearchList
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
    returnSearchList.value = returnOrderData.where((element) {
      return element['customerName'].contains(orderController.val.value) ||
          element['product'].contains(orderController.val.value) ||
          element['orderDate'].contains(orderController.val.value) ||
          element['deliveredDate'].contains(orderController.val.value) ||
          element['contactNumber'].contains(orderController.val.value);
    }).toList();

    return (orderController.val.value.isEmpty)
        ? <DataRow>[
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
          ]
        : <DataRow>[
            ...returnSearchList
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

  void Function(String)? onChanged = (val) async {
    if (val.isNotEmpty) {
      print("val=====> $val");
      orderController.val.value = val;
      orderController.stream = FirebaseHelper.firebaseHelper.firebaseFirestore
          .collection("users")
          .doc(Global.uid)
          .collection(FireStoreCollections.newOrder)
          .where(
            "customerName",
            isEqualTo: val,
          )
          .snapshots();
      await FirebaseHelper.firebaseHelper.firebaseFirestore
          .collection("users")
          .doc(Global.uid)
          .collection(FireStoreCollections.newOrder)
          .where(
            "customerName",
            isEqualTo: val,
          )
          .get()
          .then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          // orderListDataRows(list: value.docs);
        }
      });

      orderController.update();
    }
    // orderController.searchController.
  };

  Stream stream = FirebaseFirestore.instance
      .collection(FireStoreCollections.users)
      .doc(Global.uid)
      .collection(FireStoreCollections.newOrder)
      .orderBy('orderDate')
      .snapshots();

  TextStyle columnTextStyle = appTextStyle(
      color: ColorRes.white, fontSize: 14, weight: FontWeight.w500);

  TextStyle rowTextStyle = appTextStyle(
      color: ColorRes.skyBlue, fontSize: 14, weight: FontWeight.w300);
}
