import 'package:get/get.dart';

import '../../data/models/brand_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class BrandListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;


  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  BrandListModel _brandListModel = BrandListModel();

  BrandListModel get brandListModel => _brandListModel;

  Future<bool> getBrandList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.brandList);
    _inProgress = false;
    if (response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
