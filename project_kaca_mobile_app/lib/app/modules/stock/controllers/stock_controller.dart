import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/data/stock_item.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/sorter_widget.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';

class StockController extends GetxController {
  late TextEditingController searchTC;
  var ketebalanSortState = SorterStateWidget.NETRAL.obs;
  var lastUpdateSortState = SorterStateWidget.NETRAL.obs;
  var stocks = <StockItem>[].obs;
  var stocksTemp = <StockItem>[];

  @override
  void onInit() {
    super.onInit();
    searchTC = TextEditingController();
  }

  @override
  void onClose() {
    searchTC.dispose();
    super.onClose();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    stocksTemp = StockItem.dataDummyList();
    stocks.value = stocksTemp;
    ketebalanSortState.value = SorterStateWidget.NETRAL;
    lastUpdateSortState.value = SorterStateWidget.NETRAL;
    searchTC.clear();
  }

  Future<void> initLoadStokData() async {
    await Future.delayed(const Duration(seconds: 1));
    stocksTemp = StockItem.dataDummyList();
    stocks.value = stocksTemp;
  }

  void onDelIconPressed(int idx) {
    // stocksTemp.removeAt(idx);
    stocks.removeAt(idx); // [...stocksTemp] Deep Copy
  }

  void onSearchEditingCompleted(String text) {
    stocks.value = stocksTemp
        .where(
          (e) =>
              "${e.ketebalan} mm".toLowerCase().contains(text.toLowerCase()) ||
              "${e.countProduct} produk"
                  .toLowerCase()
                  .contains(text.toLowerCase()) ||
              "${Get.find<HomeController>().dateToString(e.updatedAt!)} mm"
                  .toLowerCase()
                  .contains(text.toLowerCase()),
        )
        .toList();
  }

  void onSortClicked(
      SorterStateWidget state, int Function(StockItem, StockItem)? compare) {
    stocks.sort(compare);
    if (state == SorterStateWidget.HIGHTOLOW) {
      stocks.value = stocks.reversed.toList();
    }
  }
}
