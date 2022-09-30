import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:project_kaca_mobile_app/app/modules/stock/controllers/stock_controller.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

class StockFormAddView extends StatelessWidget {
  StockFormAddView({Key? key}) : super(key: key);

  var stockC = Get.find<StockController>();
  var homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        children: [
          Text(
            "Tambah Ketebalan Kaca",
            style: Get.textTheme.headline1,
          ),
        ],
      ),
      centerTitle: true,
      elevation: 2,
    );
    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: Text(
          'StockFormAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: MyTheme.darkBlueColor,
            padding: const EdgeInsets.all(12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            "Tambah",
            style: Get.textTheme.headline2!.copyWith(color: Colors.white), 
          ),
        ),
      ),
    );
  }
}
