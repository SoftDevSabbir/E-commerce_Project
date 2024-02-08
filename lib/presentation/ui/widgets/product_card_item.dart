import 'package:cafty_bay/data/models/product_data.dart';
import 'package:cafty_bay/presentation/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key, required this.card_width, required this.product,
  });
  final ProductData product;

final double card_width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        Get.to(ProductDetailsScreen(
            productId: product.id!
        ));
      },
      child: SizedBox(
        height: 155,
        width: card_width,
        child: Card(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      color: Colors.cyan.shade50,
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: Image.network(
                          product.image??''
                        ))),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text(
                          product.title??'',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "\৳${product.price ?? 0}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              Text(
                              '${product.star??0}',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black87),
                              )
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            color: AppColors.primaryColor,
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.favorite_outline_rounded,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}