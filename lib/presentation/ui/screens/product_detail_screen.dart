import 'package:cafty_bay/presentation/ui/screens/product_review_screen.dart';
import 'package:cafty_bay/presentation/ui/widgets/product_details/product_image_card_carosel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../../data/models/product_details_data.dart';
import '../../state_holder/add_to_cart_controller.dart';
import '../../state_holder/auth_controller.dart';
import '../../state_holder/create_wish_list_controller.dart';
import '../../state_holder/product_details_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/center_circular_progress_indicator.dart';
import '../widgets/product_details/color_selection.dart';
import '../widgets/product_details/size_selection.dart';
import 'auth/verify_email_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  Color? _selectedColor;
  String? _selectedSize;
  bool onTap = false;

  @override
  void initState() {
    super.initState();
    print(AuthController.token);
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarousel(
                      urls: [
                        productDetailsController.productDetails.img1 ?? '',
                        productDetailsController.productDetails.img2 ?? '',
                        productDetailsController.productDetails.img3 ?? '',
                        productDetailsController.productDetails.img4 ?? '',
                      ],
                    ),
                    productDetailsBody(productDetailsController.productDetails),
                  ],
                ),
              ),
            ),
            priceAndAddToCartSection(productDetailsController.productDetails)
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetails productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: noOfItems,
                  builder: (context, value, _) {
                    return ItemCount(
                      buttonSizeHeight: 40,
                      buttonSizeWidth: 40,
                      initialValue: value,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        noOfItems.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          reviewAndRatingRow(productDetails.product?.star ?? 0),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Color',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          ColorSelector(
            colors: productDetails.color
                    ?.split(',')
                    .map((e) => getColorFromString(e))
                    .toList() ??
                [],
            onChange: (selectedColor) {
              _selectedColor = selectedColor;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          SizeSelector(
              sizes: productDetails.size?.split(',') ?? [],
              onChange: (s) {
                _selectedSize = s;
              }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            productDetails.des ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Row reviewAndRatingRow(int rating) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {
            Get.to(
                () => ReviewInProductListScreen(productId: widget.productId));
          },
          child: const Text(
            'Reviews',
            style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton( color: Colors.red,
            onPressed: () async {
          setState(() {
            onTap = true;
          });

              bool response = await Get.find<CreateWishListController>()
                  .createWishList(widget.productId);
              if (response) {
                Get.showSnackbar(const GetSnackBar(
                  title: 'Success',
                  message: 'This product has been added to cart',
                  duration: Duration(seconds: 2),
                  isDismissible: true,
                  backgroundColor: Colors.green,
                ));
              } else {
                Get.showSnackbar(GetSnackBar(
                  title: 'Add to wishList failed',
                  message: Get.find<CreateWishListController>().message,
                  duration: const Duration(seconds: 2),
                  isDismissible: true,
                  backgroundColor: Colors.red,
                ));
              }
            },
            icon: Icon(
              Icons.favorite,
              color:wishCircularMethod(),
            ))
      ],
    );
  }

  Container priceAndAddToCartSection(ProductDetails productDetails) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Text(
                '৳${productDetails.product!.price ?? 0}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      print("Token");
                      print(AuthController.token);
                      if (Get.find<AuthController>().isTokenNotNull) {
                        final stringColor = colorToString(_selectedColor!);
                        final response = await addToCartController.addToCart(
                            widget.productId,
                            stringColor,
                            _selectedSize!,
                            noOfItems.value);
                        if (response) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Success',
                            message: 'This product has been added to cart',
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          Get.showSnackbar(GetSnackBar(
                            title: 'Add to cart failed',
                            message: addToCartController.errorMessage,
                            duration: const Duration(seconds: 2),
                          ));
                        }
                      } else {
                        Get.to(() => VerifyEmailScreen());
                      }
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                        title: 'Add to cart failed',
                        message: 'Please select color and size',
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: const Text('Add to Cart'),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color getColorFromString(String color) {
    color = color.toLowerCase();
    if (color == 'red') {
      return Colors.red;
    } else if (color == 'white') {
      return Colors.white;
    } else if (color == 'green') {
      return Colors.green;
    }
    return Colors.grey;
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return 'Red';
    } else if (color == Colors.white) {
      return 'White';
    } else if (color == Colors.green) {
      return 'Green';
    }
    return 'Grey';
  }

  Color wishCircularMethod() {
    return onTap == true ? Colors.redAccent : Colors.black54;
  }

// Color getColorFromString(String colorCode) {
//   String code = colorCode.replaceAll('#', '');
//   String hexCode = 'FF$code';
//   return Color(int.parse('0x$hexCode'));
// }
//
// String colorToHashColorCode(String colorCode) {
//   return colorCode.toString()
//       .replaceAll('0xff', '#')
//       .replaceAll('Color(', '')
//       .replaceAll(')', '');
// }
}
