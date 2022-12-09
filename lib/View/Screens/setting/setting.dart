


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Logic/Controller/auth_controller.dart';
import '../../widgets/admin/text.dart';
import '../../widgets/setting/change_password.dart';
import '../../widgets/setting/logout.dart';
import '../../widgets/setting/notification.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 3.5.h,
            ),
            TextUtil(
              fointSize: 14.sp,
              fontWeight: FontWeight.bold,
              text: "Account",
              color: Colors.grey.shade700, underLine: TextDecoration.none,
            ),
            SizedBox(
              height: 3.5.h,
            ),
            ChangePassword(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            NotificationWidget(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            LogOut(),
          ],
        ),
      ),
    );
  }
}
