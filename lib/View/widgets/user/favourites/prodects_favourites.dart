
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Logic/Controller/prodect_controller.dart';
import '../../../../../Model/menu_items.dart';
import 'empty_favourites.dart';

class prodectsFavourites extends StatelessWidget {
  prodectsFavourites({super.key});
  final controller = Get.put(ProdectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 145,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              //margin: EdgeInsets.only(top: 20),
              child: Text(
            "Favorite",
            style: TextStyle(color: Colors.black),
          )),
          elevation: 0,
          centerTitle: true,
        ),
        body: controller.favouritesList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.favouritesList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    height: 13.8.h,
                    width: 393,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: 10.6.h,
                          width: 25.w,
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${controller.favouritesList[index]['imageUrl']}'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      "${controller.favouritesList[index]['productName']}",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Spacer(),
                                    // PopupMenu(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Text(
                                "${controller.favouritesList[index]['category']}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),

                              SizedBox(
                                height: 3.h,
                              ),

                              Row(children: [
                                Text(
                                    "\$${controller.favouritesList[index]['price']}",
                                    style: TextStyle(
                                        fontSize: 8.6.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                Spacer(),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }))
            : EmptyScreen());
  }
}
