import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:cafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart/cart_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) =>
          Get.find<MainBottomNavController>().backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Carts"),
          leading:
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        ),
        body: Column(
          children: [
            Expanded(child: ListView.separated(
        itemCount: 5,
              itemBuilder: (context, index) => CardProductItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 8,),),
        ),
            totalPriceAndCheakOutSection
          ],
        ),
      ),
    );
  }

  Container get totalPriceAndCheakOutSection {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
                Text(
                  "100000",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(onPressed: () {}, child: Text("Cheak Out")))
        ],
      ),
    );
  }
}


