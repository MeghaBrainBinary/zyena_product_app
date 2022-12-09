import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:product_app/app/utils/color_res.dart';

class SmartLoader extends StatelessWidget {
  const SmartLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: ColorRes.skyBlue,
              )
            : CircularProgressIndicator(
                color: ColorRes.skyBlue,
              ),
      ),
    );
  }
}

class SmallLoader extends StatelessWidget {
  const SmallLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: ColorRes.skyBlue,
            )
          : CircularProgressIndicator(
              color: ColorRes.skyBlue,
            ),
    );
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: ColorRes.skyBlue,
              )
            : CircularProgressIndicator(
                color: ColorRes.skyBlue,
              ),
      ),
    );
  }
}
