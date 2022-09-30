import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';

class BottomNavigationBarCustom extends GetView<HomeController> {
  const BottomNavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Stok",
            icon: Icon(
              Icons.space_dashboard,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Histori",
            icon: Icon(
              Icons.document_scanner,
            ),
          ),
        ],
        currentIndex: controller.bottomSelectedIdx.value,
        onTap: controller.onBottomItemSelected,
      ),
    );
  }
}
