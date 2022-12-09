import 'package:flutter/material.dart';
import 'package:product_app/app/common/loaders.dart';
import 'package:product_app/app/common/search_bar.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/screen/new_order_screen/widget/dropdown_button.dart';
import 'package:product_app/app/screen/order_screen/order_controller.dart';
import 'package:product_app/app/common/data_table.dart';
import 'package:product_app/app/utils/string_res.dart';
// ignore: depend_on_referenced_packages
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
                  isSearch: (title == StringRes.customers ||
                          title == StringRes.products)
                      ? false
                      : true,
                  hintText: hintText,
                  title: title!,
                  controller: controller!.obs,
                ),
              ),
              (title == StringRes.customers || title == StringRes.products)
                  ? sizedBoxHeight(height: 0.03)
                  : const SizedBox(),
              // sizedBoxHeight(height: 0.02),
              ((title == StringRes.products) || (title == StringRes.customers))
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: ((title == StringRes.pendingService) ||
                                    (title == StringRes.completeService))
                                ? serviceDropDown(
                                    context: context,
                                    items: orderListController.customerNames,
                                    hintText: orderListController.customerName,
                                    selectedValue:
                                        orderListController.customerName,
                                  )
                                : orderDropDown(
                                    isProduct: false.obs,
                                    context: context,
                                    items: orderListController.customerNames,
                                    hintText: orderListController.customerName,
                                    selectedValue:
                                        orderListController.customerName,
                                  ),
                          ),
                          sizedBoxWidth(width: 0.03),
                          ((title == StringRes.pendingService) ||
                                  (title == StringRes.completeService))
                              ? Expanded(
                                  child: Container(),
                                )
                              : Expanded(
                                  child: orderDropDown(
                                    isProduct: true.obs,
                                    context: context,
                                    items: orderListController.productNames,
                                    hintText: orderListController.productName,
                                    selectedValue:
                                        orderListController.productName,
                                  ),
                                ),
                        ],
                      ),
                    ),
              sizedBoxHeight(height: 0.02),
              Expanded(
                child: Obx(
                  () => StreamBuilder(
                    stream: ((title == StringRes.pendingService) ||
                            (title == StringRes.completeService))
                        ? orderListController.serviceStream.value
                        : orderListController.stream.value,
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
                            rows: (title == StringRes.products)
                                ? orderListController.productsDataRows(
                                    list: snapshot.data.docs, context: context)
                                : (title == StringRes.customers)
                                    ? orderListController.customersDataRows(
                                        list: snapshot.data.docs,
                                        context: context)
                                    : (title == StringRes.pendingService)
                                        ? orderListController
                                            .pendingServiceDataRows(
                                                list: snapshot.data.docs,
                                                context: context)
                                        : (title == StringRes.completeService)
                                            ? orderListController
                                                .completeServiceDataRows(
                                                    list: snapshot.data.docs)
                                            : (title == StringRes.orderList)
                                                ? orderListController
                                                    .orderListDataRows(
                                                        list:
                                                            snapshot.data.docs,
                                                        context: context)
                                                : (title ==
                                                        StringRes.pendingOrder)
                                                    ? orderListController
                                                        .pendingOrderDataRows(
                                                            list: snapshot
                                                                .data.docs,
                                                            context: context)
                                                    : (title ==
                                                            StringRes.delivered)
                                                        ? orderListController
                                                            .deliveredDataRows(
                                                                list: snapshot
                                                                    .data.docs)
                                                        : orderListController
                                                            .retuenOrderDataRows(
                                                                list: snapshot
                                                                    .data.docs),
                          ),
                        );
                      }
                      return const Center(
                        child: SmallLoader(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
