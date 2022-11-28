import 'package:flutter/material.dart';
import 'package:product_app/common/loaders.dart';
import 'package:product_app/common/search_bar.dart';
import 'package:product_app/screen/home_screen/widgets/rowlists.dart';
import 'package:product_app/screen/order_list_screen/order_list_controller.dart';
import 'package:product_app/common/data_table.dart';
import 'package:product_app/utils/string_res.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderScreen extends StatelessWidget {
  List<DataColumn>? columnList = [];
  List<DataRow>? rowList = [];
  String? title = "";
  String? hintText;
  Stream? stream;
  TextEditingController? controller;

  OrderScreen({
    super.key,
    this.columnList,
    this.rowList,
    this.title,
    this.controller,
    this.stream,
    this.hintText,
  });

  final OrderController orderListController = Get.put(OrderController());

  List items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: searchBar(
                  hintText: hintText,
                  title: title!,
                  controller: controller!.obs,
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: orderListController.stream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("ERROR : ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      items.add(snapshot.data.docs);
                      return Obx(
                        () => dataTable(
                          context: context,
                          columns: columnList!,
                          rows: (title == StringRes.orderList)
                              ? orderListController.orderListDataRows(
                                  list: snapshot.data.docs)
                              : (title == StringRes.pendingOrder)
                                  ? orderListController.pendingOrderDataRows(
                                      list: snapshot.data.docs)
                                  : (title == StringRes.delivered)
                                      ? orderListController.deliveredDataRows(
                                          list: snapshot.data.docs)
                                      : orderListController.retuenOrderDataRows(
                                          list: snapshot.data.docs),
                        ),
                      );
                    }
                    return const Center(
                      child: SmallLoader(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
