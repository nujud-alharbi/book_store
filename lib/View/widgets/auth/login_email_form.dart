
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
import 'check.dart';
import 'continer.dart';

class Login_Email_Form extends StatelessWidget {
  Login_Email_Form({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  var admin = 'admin@gmail.com';
  var pass = 'Nn1212n@';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextUtil(
                text: 'E-mail',
                color: labalColor,
                fontWeight: FontWeight.w400,
                fointSize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          AuthTextFromField(
            controller: emailController,
            obscureText: false,
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return "Worng E-mail";
              } else {
                return null;
              }
            },
            prefixIcon: Icon(
              Icons.email_outlined,
              color: labalColor,
            ),
            suffixIcon: const Text(''),
            hintText: "Enter your Email",
          ),
          SizedBox(
            height: 1.76.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextUtil(
                text: 'Password',
                color: labalColor,
                fontWeight: FontWeight.w400,
                fointSize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthTextFromField(
              maxLines: 1,
              controller: passwordController,
              obscureText: controller.isVisibilty ? false : true,
              validator: (value) {
                if (value.toString().length < 6) {
                  return " Worng password";
                } else {
                  return null;
                }
              },
              prefixIcon: Icon(
                Icons.lock_outline,
                color: labalColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.Visibilty();
                },
                icon: controller.isVisibilty
                    ? Icon(Icons.visibility_outlined,
                    color: labalColor, size: 20)
                    : Icon(Icons.visibility_off_outlined,
                    color: labalColor, size: 20),
                iconSize: 18,
              ),
              hintText: "Enter your password",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          CheckWidget(),
          SizedBox(
            height: 3.75.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  String email = emailController.text.trim();
                  String password = passwordController.text;
                  print("dubg: ${email}");
                  controller.displayUserEmail.value = email;
                  controller.loginUsingFierbase(
                      email: email, password: password);
                  // show loding page after press login in button
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(child: CircularProgressIndicator());
                    },

                  );



                }
              },
              text: "Log In",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          Container_Under(
            text: 'Dont hava an account?',
            typetext: "Sign up",
            onPressed: () {
              Get.offNamed(Routes.signup);
            },
          ),
        ],
      ),
    );
  }
}
