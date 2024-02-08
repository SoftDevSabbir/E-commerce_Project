
import 'package:cafty_bay/data/models/product_data.dart';

class ProductListModel {
  String? msg;
  List<ProductData>? productList;

  ProductListModel({this.msg, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <ProductData>[];
      json['data'].forEach((v) {
        productList!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.productList != null) {
      data['data'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}