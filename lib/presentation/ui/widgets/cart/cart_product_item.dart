import 'package:cafty_bay/data/models/cart_item.dart';
import 'package:cafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  late ValueNotifier<int> noOfItems = ValueNotifier(widget.cartItem.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(widget.cartItem.product!.image ?? '', width: 100),
          SizedBox(width: 8),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItem.product?.title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text("color: ${widget.cartItem.color ?? ''}"),
                            SizedBox(width: 2),
                            Text("size:${widget.cartItem.size ?? ''}")
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.find<CartListController>().removeFromCartList(widget.cartItem.productId!);
                        },
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\৳${widget.cartItem.product?.price ?? 0}",
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ValueListenableBuilder(
                    valueListenable: noOfItems,
                    builder: (context, value, _) {
                      return ItemCount(
                        color: AppColors.primaryColor,
                        initialValue: value,
                        minValue: 1,
                        maxValue: 10,
                        step: 1,
                        decimalPlaces: 0,
                        onChanged: (v) {
                          print(v);
                          noOfItems.value = v.toInt();
                          Get.find<CartListController>().updateQuantity(
                              widget.cartItem.id!, noOfItems.value);
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
