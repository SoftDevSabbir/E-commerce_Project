

import 'package:cafty_bay/data/models/product_details_data.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetails>? productDetailsDataList;

  ProductDetailsModel({this.msg, this.productDetailsDataList});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailsDataList = <ProductDetails>[];
      json['data'].forEach((v) {
        productDetailsDataList!.add(ProductDetails.fromJson(v));
      });
    }
  }
}