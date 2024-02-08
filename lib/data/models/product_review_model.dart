import 'package:cafty_bay/data/models/product_review_data.dart';

class ProductReviewModel {
  String? msg;
  List<ProductReviewData>? reviewData;

  ProductReviewModel({this.msg, this.reviewData});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewData = <ProductReviewData>[];
      json['data'].forEach((v) {
        reviewData!.add(ProductReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.reviewData != null) {
      data['data'] = this.reviewData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Profile {
  int? id;
  String? cusName;

  Profile({this.id, this.cusName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cus_name'] = this.cusName;
    return data;
  }
}
