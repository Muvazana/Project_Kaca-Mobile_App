import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/sorter_widget.dart';

class HistoryController extends GetxController {
  late TextEditingController searchTC;
  var ketebalanSortState = SorterStateWidget.NETRAL.obs;
  var lastUpdateSortState = SorterStateWidget.NETRAL.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
