import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

enum SorterStateWidget { NETRAL, LOWTOHIGH, HIGHTOLOW }

class SorterWidget extends StatelessWidget {
  String title;
  Rx<SorterStateWidget> state;
  Function(SorterStateWidget? state) onChange;
  SorterWidget({
    Key? key,
    required this.title,
    required this.state,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        var data = {
          SorterStateWidget.NETRAL: SorterStateWidget.LOWTOHIGH,
          SorterStateWidget.LOWTOHIGH: SorterStateWidget.HIGHTOLOW,
          SorterStateWidget.HIGHTOLOW: SorterStateWidget.LOWTOHIGH,
        };
        onChange(data[state.value]);
      },
      style: ElevatedButton.styleFrom(
        primary: MyTheme.darkPurpleColor,
        padding: const EdgeInsets.only(left: 8, right: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Get.textTheme.bodyText1!
                .copyWith(fontSize: 12, color: Colors.white),
          ),
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: state == SorterStateWidget.NETRAL ||
                      state == SorterStateWidget.LOWTOHIGH,
                  child: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Visibility(
                  visible: state == SorterStateWidget.NETRAL ||
                      state == SorterStateWidget.HIGHTOLOW,
                  child: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
