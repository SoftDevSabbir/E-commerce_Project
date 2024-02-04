import 'package:cafty_bay/data/models/payment_method_wrapper.dart';

class PaymentMethodListModel {
  String? msg;
  List<PaymentMethodWrapper>? data;

  PaymentMethodListModel({this.msg, this.data});

  PaymentMethodListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PaymentMethodWrapper>[];
      json['data'].forEach((v) {
        data!.add(new PaymentMethodWrapper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




