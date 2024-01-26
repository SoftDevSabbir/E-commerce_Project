import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_list_Item.dart';
import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final Category category;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() =>  ProductListScreen(
                  category: category.categoryName??'',
              categoryId: category.id,
                ));
          },
          child: Card(
            color: Colors.cyan.shade50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                category.categoryImg ?? '',
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
        Text(
          category.categoryName ?? '',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor),
        )
      ],
    );
  }
}
