import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/Controller/prodect_controller.dart';
import '../../../Model/product.dart';
import '../../widgets/SearchProducts.dart';
import '../../widgets/side_bar_menu.dart';
import '../../widgets/user/cart_item_customer.dart';
import '../../widgets/user/favourites/prodects_favourites.dart';

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);
  final controller = Get.put(ProdectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(


        backgroundColor: Colors.white,
        toolbarHeight: 154,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Favoruite",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(prodectsFavourites());
            },
            icon: Icon(

              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),





      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.prodects = snapshot.data!.docs
                    .map((e) => Prodect(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        category: e['category'],
                        quantity: e['quantity'],
                        price: e['price'],
                        description: e['description'],
                        imageUrl: e['imageUrl']))
                    .toList();

                print('leeength ${controller.prodects.length}');
                if (controller.prodects.isNotEmpty) {
                  return CardItem(prodects: controller.prodects);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(prodects: controller.prodects);
              }
            },



          ),

        ],

      ),

        drawer: SideBarMenu()

    );
  }
}
