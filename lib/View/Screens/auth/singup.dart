

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Logic/Controller/auth_controller.dart';

import '../../../Routes/routes.dart';
import '../../../mystring.dart';
import '../../../theme.dart';

import '../../widgets/admin/text.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_filed.dart';
import '../../widgets/auth/check.dart';
import '../../widgets/auth/continer.dart';
import '../../widgets/auth/icon_widget.dart';
import '../../widgets/auth/signup_email.dart';
import '../../widgets/auth/signup_phone.dart';


  //اول ماافتح التطبيق يتم استدعاءها
 // final controller = Get.lazyPut(() => AuthController());

  //يتم استدعاها لم اطلبها في المكان الذي اريد
  // final controllers = Get.put(AuthController());

  // final controllers = Get.find<AuthController>();

  class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: SingleChildScrollView(
  child: Padding(
  padding:
  const EdgeInsets.only(top: 90, bottom: 363, right: 40, left: 50),
  child: Column(
  children: [
  TextUtil(
  text: 'Sign Up by',

  fontWeight: FontWeight.normal,
  color: mainColor,
  underLine: TextDecoration.none, fointSize: 16.sp,),
  SizedBox(
  height: 3.7.h,
  ),
  Row(
  children: [
  GetBuilder<AuthController>(builder: (_) {
  return IconWidget(
  conternierColor: googleColor,
  onPressed: () async {
  await controller.loginUsinggoogle();

  showDialog(
  context: context,
  builder: (context) {
  return Center(child: CircularProgressIndicator());
  },

  );
  Get.toNamed(Routes.customerHome);

  },
  textUtils: 'with Google',
  image: 'assets/images/image 14google.png',
  );
  }),
  SizedBox(
  width: 4.w,
  ),
  GetBuilder<AuthController>(
  builder: (_) {
  return IconWidget(
  conternierColor: Colors.black,
  onPressed: () {},
  textUtils: 'with Apple',
  image: 'assets/images/image 14google.png',
  );
  },
  ),
  ],
  ),
  SizedBox(
  height: 6.3.h,
  ),
  TextUtil(
  text: 'or',

  fontWeight: FontWeight.normal,
  color: mainColor,
  underLine: TextDecoration.none, fointSize: 11.sp,),
  SizedBox(
  height: 2.3.h,
  ),
  Container(
  height: 40,
  child: TabBar(
  controller: controller.tabController,
  indicatorColor: Colors.black,
  labelColor: Colors.black,
  unselectedLabelColor: mainColor,
  tabs: [
  Tab(
  child: Text(
  'Email',
  style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 14),
  ),
  ),
  Tab(
  child: Text(
  'Phone number',
  style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 14),
  ),
  ),
  ],
  ),
  ),
  Container(
  height: 650,
  child:
  TabBarView(controller: controller.tabController, children: [
  SignUp_Email_Form(),
  SignUp_Phone_Number_Form(),
  ]),
  )
  ],
  ), // end page
  ),
  ),
  );
  }
  }
