import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/components/bottom_navigation_bar.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/history_controller.dart';

class HistoryView extends StatelessWidget {
  HistoryView({Key? key}) : super(key: key);
  var stockC = Get.find<HistoryController>();
  var homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(),
    );
  }
}
