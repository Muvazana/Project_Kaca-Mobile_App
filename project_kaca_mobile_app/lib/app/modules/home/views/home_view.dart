import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/home/views/widget/grid_item_card_v1_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang",
              style: Get.textTheme.headline1,
            ),
            Text(
              "Aplikasi Manajemen Kaca",
              style: Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/svg/bg_homeview.svg',
              height: Get.height / 1.7,
            ),
          ),
          GridView.count(
            // physics:
            //     const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            // shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: <Widget>[
              ItemCard(
                title: controller.items[0]['title'].toString(),
                icon: controller.items[0]['icon'],
                color: controller.items[0]['color'],
                onclickroutename: controller.items[0]['onclick'],
              ),
              ItemCard(
                title: controller.items[1]['title'].toString(),
                icon: controller.items[1]['icon'],
                color: controller.items[1]['color'],
                onclickroutename: controller.items[1]['onclick'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
