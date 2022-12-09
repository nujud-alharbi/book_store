


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Logic/Controller/auth_controller.dart';
import '../../../Logic/Controller/seting_controller.dart';
import '../../../Routes/routes.dart';
import '../../widgets/admin/text.dart';
import '../../widgets/setting/edit_profile.dart';
import '../../widgets/setting/settings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("image path ${controller.imagePath1}");
    print("username ${authController.displayUserName.value}");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
            centerTitle: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Get.toNamed(Routes.customerHome);

              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: GetBuilder<AuthController>(builder: (_) {
            return Obx(() => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: authController.displayUserPhoto.value == ""
                              ? const AssetImage("assets/images/avtar.png")
                          as ImageProvider
                              : NetworkImage(
                            authController.displayUserPhoto.value,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextUtil(
                      text: authController.displayUserName.value,
                      color: Colors.black,
                      fointSize: 12.sp,
                      fontWeight: FontWeight.bold, underLine: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 0.6.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextUtil(
                      text: authController.displayDescription.value,
                      color: Colors.black87,
                      fointSize: 9.sp,
                      fontWeight: FontWeight.w500, underLine: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 0.6.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextUtil(
                      text: authController.displayUserEmail.value,
                      color: Colors.black45,
                      fointSize: 9.sp,
                      fontWeight: FontWeight.w500, underLine: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextUtil(
                      fointSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      text: "Account",
                      color: Colors.grey.shade700, underLine:TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  EditProfile(),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SettingsWidget(),
                ],
              ),
            ));
          })),
    );
  }
}
