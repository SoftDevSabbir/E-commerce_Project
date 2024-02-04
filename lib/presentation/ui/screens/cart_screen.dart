import 'package:cafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/checkout_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });

    super.initState();
  }

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
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount:
                      cartListController.cartListModel.cartItemList?.length ??
                          0,
                  itemBuilder: (context, index) => CardProductItem(
                    cartItem:
                        cartListController.cartListModel.cartItemList![index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                ),
              ),
              totalPriceAndCheakOutSection(cartListController.totalPrice),
            ],
          );
        }),
      ),
    );
  }

  Container totalPriceAndCheakOutSection(RxDouble totalPrice) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
                Obx(() => Text(
                      "৳$totalPrice",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CheckoutScreen());
                  },
                  child: const Text("Cheak Out")))
        ],
      ),
    );
  }
}
