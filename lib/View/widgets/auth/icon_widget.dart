


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../admin/text.dart';

class IconWidget extends StatelessWidget {
  final String image;
  final Function() onPressed;
  final String textUtils;
  final Color conternierColor;

  const IconWidget(
      {required this.image,
        required this.textUtils,
        required this.onPressed,
        required this.conternierColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6.10.h,
        width: 33.84.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: conternierColor),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 5.85.w,
                  height: 2.81.h,
                ),
                SizedBox(
                  width: 1.52.w,
                ),
                TextUtil(
                  color: Colors.white,
                  fointSize: 9.sp,
                  fontWeight: FontWeight.normal,
                  underLine: TextDecoration.none,
                  text: textUtils,
                ),
              ],
            )));
  }
}
