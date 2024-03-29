import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/main_bottom_nav_controller.dart';
import '../../state_holder/show_wish_list_controller.dart';
import '../widgets/wish_list_product_item.dart';


class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ShowWishListController>().showWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          Get.find<ShowWishListController>().showWishList();
        },
        child: GetBuilder<ShowWishListController>(
            builder: (showWishListController) {
              if (showWishListController.showWishListInProgress) {
                return const Center(
                  child: CenterCircularProgressIndicator(),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Wish List',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                  ),
                  leading:  InkWell(
                      onTap: (){ Get.find<MainBottomNavController>().backToHome();},
                      child: const Icon(Icons.arrow_back_ios_new))
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount:
                    showWishListController.showWishListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return WishListProductCard(
                        showWishListData:
                        showWishListController.showWishListModel.data![index],
                      );
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
