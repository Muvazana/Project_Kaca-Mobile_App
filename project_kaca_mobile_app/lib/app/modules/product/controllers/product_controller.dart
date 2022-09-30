import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/data/product_item.dart';
import 'package:project_kaca_mobile_app/app/data/stock_item.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/sorter_widget.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';

class ProductController extends GetxController {
  late TextEditingController searchTC;
  late StockItem stockItem;

  var luasSortState = SorterStateWidget.NETRAL.obs;
  var lastUpdateSortState = SorterStateWidget.NETRAL.obs;

  var products = <ProductItem>[].obs;
  var productsTemp = <ProductItem>[];

  @override
  void onInit() {
    super.onInit();
    stockItem = Get.arguments as StockItem;
    searchTC = TextEditingController();
  }

  @override
  void onClose() {
    searchTC.dispose();
    super.onClose();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    productsTemp = ProductItem.dataDummyList();
    products.value = productsTemp;
    luasSortState.value = SorterStateWidget.NETRAL;
    lastUpdateSortState.value = SorterStateWidget.NETRAL;
    searchTC.clear();
  }

  Future<void> initLoadStokData() async {
    await Future.delayed(const Duration(seconds: 1));
    productsTemp = ProductItem.dataDummyList();
    products.value = productsTemp;
  }

  void onDelIconPressed(int idx) {
    // productsTemp.removeAt(idx);
    products.removeAt(idx); // [...productsTemp] Deep Copy
  }

  void onSearchEditingCompleted(String text) {
    products.value = productsTemp
        .where(
          (e) =>
              "${e.lebar! * e.panjang!} cm^2 -  ${e.lebar} x ${e.panjang} cm"
                  .toLowerCase()
                  .contains(text.toLowerCase()) ||
              "- produk" // "${e.} produk" // TODO change
                  .toLowerCase()
                  .contains(text.toLowerCase()) ||
              "${Get.find<HomeController>().dateToString(e.updatedAt!)} mm"
                  .toLowerCase()
                  .contains(text.toLowerCase()),
        )
        .toList();
  }

  void onSortClicked(SorterStateWidget state,
      int Function(ProductItem, ProductItem)? compare) {
    products.sort(compare);
    if (state == SorterStateWidget.HIGHTOLOW) {
      products.value = products.reversed.toList();
    }
  }
}
