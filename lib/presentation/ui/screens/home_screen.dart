import 'package:cafty_bay/presentation/state_holder/category_controller.dart';
import 'package:cafty_bay/presentation/state_holder/home_banner_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:cafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                            bannerList:homeBannerController.bannerListModel.bannerList ?? [],
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
              SectionTittle(
                tittle: "Popular",
                onTapSeeAll: () {
                  Get.to(() => productListScreen());
                },
              ),
              ProductList,
              SectionTittle(
                tittle: "Special",
                onTapSeeAll: () {},
              ),
              ProductList,
              SectionTittle(
                tittle: "New",
                onTapSeeAll: () {},
              ),
              ProductList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get CategoryList {
    return SizedBox(
      height: 115,
      child: GetBuilder<CatergoryController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.inProgress==false,
            replacement: CenterCircularProgressIndicator(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItem(
                  category: categoryController.categoryListModel.categoryList![index],
              ),
              itemCount:categoryController.categoryListModel.categoryList?.length??0,
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(
                width: 8,
              ),
            ),
          );
        }
      ),
    );
  }

  SizedBox get ProductList {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCardItem(
            card_width: 117,
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
          fillColor: Color(0xffe6e6e7),
          prefixIcon: Icon(
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
          ontap: () {},
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
      ],
    );
  }
}
