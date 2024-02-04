import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holder/main_bottom_nav_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Wish List",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 40,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .98,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              // FittedBox(
              //     child: ProductCardItem(
              //       card_width: 145,
              //     ));
            }
          ),
        ),
      ),
    );
  }
}
