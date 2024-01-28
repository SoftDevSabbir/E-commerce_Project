import 'package:cafty_bay/data/services/network_caller.dart';
import 'package:cafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _inProgress=false;
  String _errorMessage='';
  bool get inProgress=>_inProgress;
  String get errorMessage=>_errorMessage;
  Future<bool> addToCart (int productId,String color,String size)async{
    bool isSuccess=false;
    _inProgress=true;
    Map<String,dynamic>inputParams={
      "product_id": productId,
      "color":  color,
      "size": size
    };
    final response=await NetworkCaller().postRequest(Urls.addToCart,body: inputParams);
    if(response.isSuccess){
      isSuccess=true;
    }else{
      _errorMessage=response.errorMessage;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}