

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../theme.dart';
import '../admin/text.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(40.7.w, 5.6.h),
      ),
      child: TextUtil(
        color: Colors.white,
        text: text,

        fontWeight: FontWeight.w500,
        underLine: TextDecoration.none, fointSize: 11.sp,
      ),
    );
  }
}