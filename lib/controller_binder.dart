import 'package:cafty_bay/presentation/state_holder/add_product_review_controller.dart';
import 'package:cafty_bay/presentation/state_holder/add_to_cart_controller.dart';
import 'package:cafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:cafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:cafty_bay/presentation/state_holder/category_controller.dart';
import 'package:cafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:cafty_bay/presentation/state_holder/create_invoice_controller.dart';
import 'package:cafty_bay/presentation/state_holder/home_banner_controller.dart';
import 'package:cafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:cafty_bay/presentation/state_holder/new_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/popular_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/product_details_controller.dart';
import 'package:cafty_bay/presentation/state_holder/product_review_controller.dart';
import 'package:cafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:cafty_bay/presentation/state_holder/send_email_otp_controller.dart';
import 'package:cafty_bay/presentation/state_holder/show_wish_list_controller.dart';
import 'package:cafty_bay/presentation/state_holder/special_product_controller.dart';
import 'package:cafty_bay/presentation/state_holder/verify_otp_controller.dart';
import 'package:cafty_bay/presentation/state_holder/create_wish_list_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerController());
    Get.put(CatergoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(CreateInvoiceController());
    Get.put(CreateWishListController());
    Get.put(ShowWishListController());
    Get.put(ProdutReviewListController());
    Get.put(AddProdutReviewController());
}

}
