import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/components/bottom_navigation_bar.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/sorter_widget.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/text_formfield_custom_v1.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:project_kaca_mobile_app/app/modules/product/views/widgets/product_view_listtile.dart';

import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  var productC = Get.find<ProductController>();
  var homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        children: [
          Text(
            "Main Produk Overview",
            style: Get.textTheme.headline2,
          ),
          Text(
            "Ketebalan Kaca: ${productC.stockItem.ketebalan} mm",
            style: Get.textTheme.headline3,
          ),
        ],
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //     onPressed: () {}, // TODO Detail Stok
      //     icon: const Icon(
      //       Icons.info,
      //       color: MyTheme.darkPurpleColor,
      //       size: 32,
      //     ),
      //   ),
      // ],
      elevation: 2,
    );
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            // TODO filter
            Column(
              children: [
                TextFormfieldCustomV1(
                  hintText: "Search",
                  prefixIcon: Icons.search_outlined,
                  controller: productC.searchTC,
                  onChange: productC.onSearchEditingCompleted,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Filter:",
                          style:
                              Get.textTheme.bodyText1!.copyWith(fontSize: 14),
                        ),
                        const SizedBox(width: 6),
                        SorterWidget(
                          title: "Luas (^2)",
                          state: productC.luasSortState,
                          onChange: (state) {
                            productC.luasSortState.value = state!;
                            productC.lastUpdateSortState.value =
                                SorterStateWidget.NETRAL;
                            productC.onSortClicked(
                                state,
                                (a, b) => (a.lebar! * a.panjang!)
                                    .compareTo(b.lebar! * b.panjang!));
                          },
                        ),
                        const SizedBox(width: 6),
                        SorterWidget(
                          title: "update",
                          state: productC.lastUpdateSortState,
                          onChange: (state) {
                            productC.lastUpdateSortState.value = state!;
                            productC.luasSortState.value =
                                SorterStateWidget.NETRAL;
                            productC.onSortClicked(state,
                                (a, b) => a.updatedAt!.compareTo(b.updatedAt!));
                          },
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        "${productC.products.length} Items",
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Listview
            Expanded(
              child: FutureBuilder(
                future: productC.initLoadStokData(),
                builder: (_, snap) {
                  switch (snap.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      {
                        return const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    case ConnectionState.done:
                      {
                        var layoutBuilder = LayoutBuilder(
                          builder: (context, constraints) => ListView(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: Center(
                                  child: Text("Tidak ada data!",
                                      style: Get.textTheme.bodyText1),
                                ),
                              )
                            ],
                          ),
                        );
                        var listView = Obx(
                          () => ListView.builder(
                              itemCount: productC.products.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: Get.height / 10),
                              itemBuilder: (_, index) {
                                var selectedItem =
                                    productC.products.elementAt(index);
                                return productViewListTile(
                                  title:
                                      "${selectedItem.lebar! * selectedItem.panjang!} cm^2 -  ${selectedItem.lebar} x ${selectedItem.panjang} cm",
                                  jumPotongan: "- produk",
                                  lastUpdate: homeC
                                      .dateToString(selectedItem.updatedAt!),
                                  onListTilePressed: () {},
                                  onDelIconPressed: () =>
                                      productC.onDelIconPressed(index),
                                );
                              }),
                        );
                        return RefreshIndicator(
                          onRefresh: productC.onRefresh,
                          child: productC.products.isNotEmpty
                              ? listView
                              : layoutBuilder,
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO add
        child: const Icon(Icons.add, size: 32),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(),
    );
  }
}
