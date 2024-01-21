import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
         onPopInvoked: (value){
           Get.find<MainBottomNavController>().backToHome();
         },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Categories",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: GridView.builder(
          itemCount: 40,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,childAspectRatio: 0.95,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8
              ),
          itemBuilder: (context, index) => FittedBox(child: CategoreiItem()),
        ),
      ),

    );

  }

}

