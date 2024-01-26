import 'package:cafty_bay/presentation/state_holder/category_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/state_holder/new_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/popular_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/special_product_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../state_holder/home_banner_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List _screen = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen()
  ];
  @override
  void initState() {
    Get.find<HomeBannerController>().getBannerList();
    Get.find<CatergoryController>().getCategoryList();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<SpecialProductController>().getSpecialProductList();
    Get.find<NewProductController>().getNewProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) => Scaffold(
        body: _screen[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          currentIndex: controller.currentIndex,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap:
          controller.changeIndex,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
          ],
        ),
      ),
    );
  }
}
