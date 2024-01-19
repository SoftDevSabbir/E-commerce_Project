import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class CardProductItem extends StatelessWidget {
  CardProductItem({super.key});
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(AssetPath.shoe, width: 100),
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
                              "Nike shoe 12h New wedqwedqwd dwedwede",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text("color: red"),
                                SizedBox(width: 2),
                                Text("size: XL")
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$100",
                        style: TextStyle(
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