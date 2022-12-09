


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../admin/text.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtil(
          fointSize: 12.sp,
          fontWeight: FontWeight.w300,
          text: "Notification",
          color: Colors.black, underLine: TextDecoration.none,
        ),
        Switch(
          activeTrackColor: Colors.green,
          activeColor: Colors.green,
          value: false,
          onChanged: (_) {},
        ),
      ],
    );
  }
}