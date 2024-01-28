import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class ProductImageCarosel extends StatefulWidget {
  const ProductImageCarosel({
    super.key,
    this.height, required this.urls,
  });

  final double? height;
  final List<String>urls;

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
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin:  EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      image: DecorationImage(image: NetworkImage(url))
                       ),
                    alignment: Alignment.center

                );

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
                    for (int i = 0; i < widget.urls.length; i++)
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
