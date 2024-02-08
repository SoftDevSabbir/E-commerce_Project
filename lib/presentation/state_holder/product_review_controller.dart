
import 'package:get/get.dart';
import '../../data/models/product_review_data.dart';
import '../../data/models/product_review_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProdutReviewListController extends GetxController {
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

  Future<bool> showReviewList(int id) async {
    _showReviewListInProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.productReviewList(id));
    _showReviewListInProgress = false;
    if (response.isSuccess) {
      _productReviewModel  =ProductReviewModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      _message = 'Review list fetch failed! Try again';
      update();
      return false;
    }
  }

}

//
// import 'package:get/get.dart';
// import '../../data/models/product_review_data.dart';
// import '../../data/models/product_review_model.dart';
// import '../../data/models/response_data.dart';
// import '../../data/services/network_caller.dart';
// import '../../data/utility/urls.dart';
//
// class ProductReviewListController extends GetxController {
//   bool _showReviewListInProgress = false;
//
//   ProductReviewData _productReviewData = ProductReviewData();
//
//   String _errorMessage = '';
//
//   bool get inProgress => _showReviewListInProgress;
//
//   ProductReviewData get productReviewData => _productReviewData;
//
//   String get errorMessage => _errorMessage;
//
//   Future<bool> showReviewList(int productId) async {
//     bool isSuccess = false;
//     _showReviewListInProgress = true;
//     update();
//     final ResponseData response =
//     await NetworkCaller().getRequest(Urls.productDetails(productId));
//     _showReviewListInProgress = false;
//     if (response.isSuccess) {
//       // _productDetailsData =
//       //     ProductDetails.fromJson(response.responseData);
//       _productReviewData =
//           ProductReviewModel.fromJson(response.responseData ?? '').reviewData!.first;
//       update();
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }
//     _showReviewListInProgress = false;
//     update();
//     return isSuccess;
//   }
// }
