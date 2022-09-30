import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/modules/home/controllers/home_controller.dart';

class ItemCard extends StatelessWidget {
  String title, onclickroutename;
  IconData icon;
  Color color;
  ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onclickroutename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () =>
            Get.find<HomeController>().onHomeViewItemSelected(onclickroutename),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Colors.white,
                      color,
                    ],
                  ),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: Get.textTheme.headline2!.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
