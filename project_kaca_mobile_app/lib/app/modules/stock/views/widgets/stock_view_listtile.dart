import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/components/widgets/listtile_custom_base.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

ListTileCustomBase stockViewListTile({
  required String title,
  required String jumProduk,
  required String lastUpdate,
  required Function()? onListTilePressed,
  required Function()? onDelIconPressed,
}) {
  return ListTileCustomBase(
    title: title,
    onTap: onListTilePressed,
    subTitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 12),
            children: <TextSpan>[
              const TextSpan(text: 'Jumlah Produk: '),
              TextSpan(
                text: jumProduk,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 12),
            children: <TextSpan>[
              const TextSpan(text: 'Terakhir di update: '),
              TextSpan(
                text: lastUpdate,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
    leading: const CircleAvatar(
      backgroundColor: MyTheme.darkBlueColor,
    ),
    trailing: IconButton(
      onPressed: onDelIconPressed,
      icon: const Icon(
        Icons.delete_forever,
        color: MyTheme.redColor,
        size: 32,
      ),
    ),
  );
}
