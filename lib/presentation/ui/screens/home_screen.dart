import 'package:cafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:cafty_bay/presentation/state_holder/brand_controller.dart';
import 'package:cafty_bay/presentation/state_holder/category_controller.dart';
import 'package:cafty_bay/presentation/state_holder/home_banner_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/state_holder/new_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/popular_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/special_product_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:cafty_bay/presentation/ui/screens/user_profile_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_data.dart';
import '../widgets/category_item.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/home/section_tittle.dart';
import '../widgets/banner_carosel.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              searchTextFeild,
              const SizedBox(height: 16),
              SizedBox(
                  height: 180,
                  child: GetBuilder<HomeBannerController>(
                    builder: (homeBannerController) {
                      return Visibility(
                        visible: homeBannerController.inProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: BannerCarousel(
                          bannerList:
                              homeBannerController.bannerListModel.bannerList ??
                                  [],
                        ),
                      );
                    },
                  )),
              const SizedBox(height: 8),
              SectionTittle(
                tittle: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              CategoryList,
              const SizedBox(height: 8),
              SectionTittle(
                tittle: "All Brands",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              brandList,
              SectionTittle(
                tittle: "Popular",
                onTapSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                return Visibility(
                  visible: popularProductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: ProductList(
                      popularProductController.productListModel.productList ??
                          []),
                );
              }),
              SectionTittle(
                tittle: "Special",
                onTapSeeAll: () {},
              ),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                return Visibility(
                  visible: specialProductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: ProductList(
                      specialProductController.productListModel.productList ??
                          []),
                );
              }),
              SectionTittle(
                tittle: "New",
                onTapSeeAll: () {},
              ),
              GetBuilder<NewProductController>(builder: (newProductController) {
                return Visibility(
                  visible: newProductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: ProductList(
                      newProductController.productListModel.productList ?? []),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get CategoryList {
    return SizedBox(
      height: 115,
      child: GetBuilder<CatergoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryBrandItem(
              categoryData:
                  categoryController.categoryListModel.categoryList![index],
            ),
            itemCount:
                categoryController.categoryListModel.categoryList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              width: 8,
            ),
          ),
        );
      }),
    );
  }

  SizedBox get brandList {
    return SizedBox(
      height: 100,
      child: GetBuilder<BrandListController>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.brandListModel.brandDataList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryBrandItem(
                brandData: controller.brandListModel.brandDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox ProductList(List<ProductData> productList) {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        itemCount: productList.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCardItem(
            card_width: 117,
            product: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFeild {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color(0xffe6e6e7),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          )),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetPath.logoNav),
      actions: [
        CircleIconButton(
          ontap: ()async {
            Get.to(()=>const UserProfileScreen());
          },
          iconData: Icons.person,

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconButton(
            ontap: () {},
            iconData: Icons.call,
          ),
        ),
        CircleIconButton(
          ontap: () {},
          iconData: Icons.notification_add_outlined,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<AuthController>(
            builder: (authController) {
              return CircleIconButton(
                ontap: () {
                  if(authController.isTokenNotNull){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return logOutAlertDialogue;
                        });
                  }else{
                    Get.to(VerifyEmailScreen());
                  }

                },
                iconData: Icons.logout,
              );
            }
          ),
        ),
      ],
    );
  }

  AlertDialog get logOutAlertDialogue {
      return AlertDialog(
     title: const Text('LogOut'),
     content: const Text('Do you want to logout?'),
     actions: [
       TextButton(
           onPressed: () {
             Get.back();
           },
           child: const Text('No')),
       TextButton(
           onPressed: () {
             AuthController.clearAuthData();
             Get.offAll(() =>  VerifyEmailScreen());
           },
           child: const Text('Yes')),
     ],
                        );
  }
}

