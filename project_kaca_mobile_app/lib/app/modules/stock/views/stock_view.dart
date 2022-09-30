import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/components/bottom_navigation_bar.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/sorter_widget.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/text_formfield_custom_v1.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:project_kaca_mobile_app/app/modules/stock/views/widgets/stock_view_listtile.dart';
import 'package:project_kaca_mobile_app/app/routes/app_pages.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

import '../controllers/stock_controller.dart';

class StockView extends StatelessWidget {
  StockView({Key? key}) : super(key: key);

  var stockC = Get.find<StockController>();
  var homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(
        "Stok Overview",
        style: Get.textTheme.headline1,
      ),
      actions: [
        IconButton(
          onPressed: () {}, // TODO Detail Stok
          icon: const Icon(
            Icons.info,
            color: MyTheme.darkPurpleColor,
            size: 32,
          ),
        ),
      ],
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
                  controller: stockC.searchTC,
                  onChange: stockC.onSearchEditingCompleted,
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
                          title: "ketebalan",
                          state: stockC.ketebalanSortState,
                          onChange: (state) {
                            stockC.ketebalanSortState.value = state!;
                            stockC.lastUpdateSortState.value =
                                SorterStateWidget.NETRAL;
                            stockC.onSortClicked(state,
                                (a, b) => a.ketebalan!.compareTo(b.ketebalan!));
                          },
                        ),
                        const SizedBox(width: 6),
                        SorterWidget(
                          title: "update",
                          state: stockC.lastUpdateSortState,
                          onChange: (state) {
                            stockC.lastUpdateSortState.value = state!;
                            stockC.ketebalanSortState.value =
                                SorterStateWidget.NETRAL;
                            stockC.onSortClicked(state,
                                (a, b) => a.updatedAt!.compareTo(b.updatedAt!));
                          },
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        "${stockC.stocks.length} Items",
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
                future: stockC.initLoadStokData(),
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
                              itemCount: stockC.stocks.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: Get.height / 10),
                              itemBuilder: (_, index) {
                                var selectedItem =
                                    stockC.stocks.elementAt(index);
                                return stockViewListTile(
                                  title:
                                      "${stockC.stocks.elementAt(index).ketebalan} mm",
                                  jumProduk:
                                      "${stockC.stocks.elementAt(index).countProduct} produk",
                                  lastUpdate: homeC.dateToString(stockC.stocks
                                      .elementAt(index)
                                      .updatedAt!),
                                  onListTilePressed: () {
                                    Get.toNamed(
                                      Routes.PRODUCT,
                                      arguments: stockC.stocks.elementAt(index),
                                    )?.then((value) => stockC.onRefresh());
                                  },
                                  onDelIconPressed: () =>
                                      stockC.onDelIconPressed(index),
                                );
                              }),
                        );
                        return RefreshIndicator(
                          onRefresh: stockC.onRefresh,
                          child: stockC.stocks.isNotEmpty
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
        onPressed: () {
          Get.toNamed(Routes.STOCKFORMADD)?.then((_) => stockC.refresh());
        },
        child: const Icon(Icons.add, size: 32),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(),
    );
  }
}
