import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileCustomBase extends StatelessWidget {
  String? title;
  Widget? leading, trailing, subTitle;
  Function()? onTap; 
  ListTileCustomBase({
    Key? key,
    required this.title,
    required this.subTitle,
    this.leading,
    this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[100],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        leading: leading,
        title: Text(
          title!,
          style: Get.textTheme.headline3!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subTitle,
        trailing: trailing,
      ),
    );
  }
}
