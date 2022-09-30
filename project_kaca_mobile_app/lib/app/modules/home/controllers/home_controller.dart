import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var bottomSelectedIdx = 1.obs;
  List<Map<String, dynamic>> items = [
    {
      'title': "Stok",
      'icon': Icons.space_dashboard,
      'color': Colors.blueGrey,
      'onclick': Routes.STOCK,
    },
    {
      'title': "Histori",
      'icon': Icons.document_scanner,
      'color': Colors.orange,
      'onclick': Routes.HISTORY,
    },
  ];

  void onHomeViewItemSelected(String route) {
    switch (route) {
      case Routes.STOCK:
        onBottomItemSelected(0);
        break;
      case Routes.HISTORY:
        onBottomItemSelected(2);
        break;
      default:
        onBottomItemSelected(1);
        break;
    }
  }

  void onBottomItemSelected(int idx) {
    Get.focusScope!.unfocus();
    if (idx == bottomSelectedIdx.value) return;
    switch (idx) {
      case 0:
        Get.offAllNamed(Routes.STOCK);
        break;
      case 2:
        Get.offAllNamed(Routes.HISTORY);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
        break;
    }
    bottomSelectedIdx.value = idx;
  }
  
  String dateToString(DateTime date){
    var bulan = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];

    return "${date.day} ${bulan.elementAt(date.month-1)} ${date.year}";
  }
}
