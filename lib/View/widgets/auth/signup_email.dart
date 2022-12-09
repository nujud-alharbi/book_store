


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Logic/Controller/auth_controller.dart';
import '../../../Routes/routes.dart';
import '../../../mystring.dart';
import '../../../theme.dart';
import '../admin/text.dart';
import 'auth_button.dart';
import 'auth_text_filed.dart';

class SignUp_Email_Form extends StatelessWidget {
  SignUp_Email_Form({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          TextUtil(
              text: 'Name',
              fointSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          AuthTextFromField(
            controller: nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: mainColor,
            ),
            suffixIcon: const Text(''),
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Enter your name ';
              } else {
                return null;
              }
            },
            hintText: 'Enter your name',
          ),
          SizedBox(
            height: 1.7.h,
          ),
          TextUtil(
              text: 'E-mail',
              fointSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          AuthTextFromField(
            controller: emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: mainColor,
            ),
            suffixIcon: const Text(''),
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return 'Invalid Email';
              } else {
                return null;
              }
            },
            hintText: 'Enter your E-mail',
          ),
          SizedBox(
            height: 1.7.h,
          ),
          TextUtil(
              text: 'Password',
              fointSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          GetBuilder<AuthController>(
            builder: (_) {
              return AuthTextFromField(
                maxLines: 1,
                controller: passwordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: mainColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.Visibilty();
                  },
                  icon: controller.isVisibilty
                      ? Icon(
                    Icons.visibility_outlined,
                    color: mainColor,
                    size: 2.3.h,
                  )
                      : Icon(
                    Icons.visibility_off_outlined,
                    color: mainColor,
                    size: 2.3.h,
                  ),
                ),
                obscureText: controller.isVisibilty ? false : true,
                validator: (value) {
                  if (!RegExp(validationPassword).hasMatch(value)) {
                    return 'Password length must be 8 and contain a number,\n a special symbol, and an uppercase letter.';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your password',
              );
            },
          ),
          SizedBox(
            height: 1.7.h,
          ),
          TextUtil(
              text: 'Re-Password',
              fointSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          GetBuilder<AuthController>(
            builder: (_) {
              return AuthTextFromField(
                maxLines: 1,
                controller: rePasswordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: mainColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.Visibilty2();
                  },
                  icon: controller.isVisibilty2
                      ? Icon(
                    Icons.visibility_outlined,
                    color: mainColor,
                    size: 2.3.h,
                  )
                      : Icon(
                    Icons.visibility_off_outlined,
                    color: mainColor,
                    size: 2.3.h,
                  ),
                ),
                obscureText: controller.isVisibilty ? false : true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'The entered password does not match.';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your password again',
              );
            },
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Container(
            alignment: Alignment.center,
            child: GetBuilder<AuthController>(
              builder: (_) {
                return AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {

                        String email = emailController.text.trim();
                        String password = passwordController.text;
                        String name = nameController.text;

                        controller.signUpUsingFirebase(
                            email: email, password: password, name: name);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },

                        );

                        Get.toNamed(Routes.logIn);
                      }
                    },
                    text: 'Sign Up');
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtil(
                  text: 'Already have account ?',
                  fointSize: 9.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                width: 0.5.w,
              ),
              TextButton(
                onPressed: () {
                  Get.offNamed(Routes.logIn);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: TextUtil(
                    text: 'Login',
                    fointSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: buttonColor,
                    underLine: TextDecoration.underline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
