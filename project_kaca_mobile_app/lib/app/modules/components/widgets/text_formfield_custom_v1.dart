import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kaca_mobile_app/app/utils/my_theme.dart';

class TextFormfieldCustomV1 extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  IconData? prefixIcon;
  String? suffixText;
  TextInputType? textInputType;
  Function(String)? onChange;

  TextFormfieldCustomV1({
    Key? key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixText,
    this.textInputType = TextInputType.text,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      keyboardType: textInputType,
      style: Get.textTheme.bodyText1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: prefixIcon == null ? 12 : 0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.darkGrayColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.darkGrayColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        fillColor: Colors.transparent,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: MyTheme.darkGrayColor,
              ),
        suffixIcon: suffixText == null
            ? null
            : Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  suffixText!,
                  style: Get.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
        hintStyle: const TextStyle(color: MyTheme.lightGrayColor),
        hintText: hintText,
      ),
    );
  }
}
