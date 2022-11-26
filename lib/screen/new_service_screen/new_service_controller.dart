import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewServiceController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  /// add button onTap
  void addOnTap() {}
}
