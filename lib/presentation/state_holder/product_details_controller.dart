
import 'package:get/get.dart';

import '../../data/models/product_details_data.dart';
import '../../data/models/product_details_models.dart';
import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  ProductDetails _productDetailsData = ProductDetails();

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  ProductDetails get productDetails => _productDetailsData;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.productDetails(productId));
    _inProgress = false;
    if (response.isSuccess) {
      // _productDetailsData =
      //     ProductDetails.fromJson(response.responseData);
      _productDetailsData =
          ProductDetailsModel.fromJson(response.responseData ?? '').productDetailsDataList!.first;
      update();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
