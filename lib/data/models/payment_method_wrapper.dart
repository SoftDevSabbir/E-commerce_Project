import 'package:cafty_bay/data/models/payment_method.dart';

class PaymentMethodWrapper {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  PaymentMethodWrapper({this.paymentMethod, this.payable, this.vat, this.total});

  PaymentMethodWrapper.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(new PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] =
          this.paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = this.payable;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}