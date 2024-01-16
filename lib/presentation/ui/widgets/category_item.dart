
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoreiItem extends StatelessWidget {
  const CategoreiItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Get.to(()=>const productListScreen(category: 'Electronic',));
          },
          child: Card(
            color:Colors.cyan.shade50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer,
                size: 35,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        Text(
          "Electronic",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor),
        )
      ],
    );
  }
}
