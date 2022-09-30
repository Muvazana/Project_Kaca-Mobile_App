import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light(),
      title: "Manajemen Kaca App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
