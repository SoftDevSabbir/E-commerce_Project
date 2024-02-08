
import 'package:get/get.dart';
import '../../data/models/product_review_data.dart';
import '../../data/models/product_review_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddProdutReviewController extends GetxController {
  bool _showReviewListInProgress = false;
  ProductReviewModel _productReviewModel = ProductReviewModel();
  Profile _profile = Profile();
  ProductReviewData _productReviewData = ProductReviewData();
  String _message = '';

  bool get showReviewListInProgress => _showReviewListInProgress;
  ProductReviewModel get productReviewModel => _productReviewModel;
  Profile get profileData => _profile;
  ProductReviewData get productReviewData => _productReviewData;
  String get message => _message;

  Future<bool> CreateReview(String ReviewDescribtion,int Product_id,int rating) async {
    _showReviewListInProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.addProductReview,body:
    {
      "description":ReviewDescribtion,
      "product_id":Product_id,
      "rating":rating
    }
    );
    _showReviewListInProgress = false;
    if (response.isSuccess) {
      _productReviewModel  =ProductReviewModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      _message = 'Review Adding failed! Try again';
      update();
      return false;
    }
  }

}