import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/banner.dart';
import '../utility/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    this.height,
    required this.bannerList,
  });

  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 155.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
             enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryColor,
                  ),
                  child: Stack(
                    children: [
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                    image: NetworkImage(banner.image ?? ""),)),
                              alignment: Alignment.center)),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 15.0,top: 32),
                         child: Expanded(
                             flex:1,
                             child: Container(
                                 width:170,
                                 child: carosel_product_text(banner))),
                       ),
                     ],
                   )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.bannerList.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                ],
              );
            })
      ],
    );
  }

  Column carosel_product_text(BannerItem banner) {
    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          banner.title ?? "",
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          height: 40,
                          width: 120,
                          child: const Center(
                              child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          )),
                        )
                      ],
                    );
  }
}
