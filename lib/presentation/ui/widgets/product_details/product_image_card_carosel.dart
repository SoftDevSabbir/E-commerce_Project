import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class ProductImageCarosel extends StatefulWidget {
  const ProductImageCarosel({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<ProductImageCarosel> createState() => _ProductImageCaroselState();
}

class _ProductImageCaroselState extends State<ProductImageCarosel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            // enableInfiniteScroll: false,
            // autoPlay: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                       ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        Positioned(
           bottom: 10,
          left: 0,
           right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.white,
                            border: Border.all(
                              color: i == index
                                  ? AppColors.primaryColor
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
