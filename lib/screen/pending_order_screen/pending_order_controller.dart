import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/utils/appstyle.dart';
import 'package:product_app/utils/color_res.dart';

class PendingOrderController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();

  Widget verticalDivider = VerticalDivider(
    color: ColorRes.color9A9ABF,
    thickness: 1,
  );

  TextStyle columnTextStyle = appTextStyle(
      color: ColorRes.white, fontSize: 16, weight: FontWeight.w500);

  TextStyle rowTextStyle = appTextStyle(
      color: ColorRes.skyBlue, fontSize: 14, weight: FontWeight.w300);

  final List<Map<String, dynamic>> listOfRows = [
    {
      "num": 1,
      "divider": VerticalDivider(
        color: ColorRes.color9A9ABF,
        thickness: 0.5,
      ),
      "customer_name": "Lorem ipsum",
      "product_name": "xyz",
      "order_date": "00/00/0000",
      "due_date": "00/00/0000",
      "deliver/cancel": "Deliver",
      "contact_number": "00000 00000",
    },
    {
      "num": 2,
      "divider": VerticalDivider(
        color: ColorRes.color9A9ABF,
        thickness: 0.5,
      ),
      "customer_name": "Lorem ipsum",
      "product_name": "xyz",
      "order_date": "00/00/0000",
      "due_date": "00/00/0000",
      "deliver/cancel": "Deliver",
      "contact_number": "00000 00000",
    },
  ];
}
