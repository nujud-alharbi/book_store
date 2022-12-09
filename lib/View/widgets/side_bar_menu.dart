import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Logic/Controller/auth_controller.dart';
import '../../Routes/routes.dart';

class SideBarMenu extends StatelessWidget {
   SideBarMenu({super.key});
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 20,
          ),
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'Book Store',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Dashboard'),
          ),
          ListTile(
            leading: Icon(Icons.import_export),
            title: const Text('Stock'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added_sharp),
            title: const Text('Orders'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Customars'),
          ),
          SizedBox(height: 220),
          ListTile(
            onTap: (){


                  Get.offNamed(Routes.profileScreen);






            },
            leading: Icon(Icons.account_circle),
            title:  Text(authController.displayUserName.value),

          ),
        ],
      ),
    );
  }
}
