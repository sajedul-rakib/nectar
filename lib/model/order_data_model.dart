import 'package:nectar/model/cart_data_model.dart';
import 'package:nectar/model/user_data_model.dart';

class OrderDataModel {
  String? id;
  String? orderId;
  UserModel? customer;
  List<CartDataModel>? items;
  String? deliveryAddress;
  num? totalPrice;
  String? paymentMethod;
  bool? paymentDone;
  String? orderStatus;
  String? orderTime;

  OrderDataModel(
      {this.id,
      this.orderId,
      this.customer,
      this.items,
      this.deliveryAddress,
      this.totalPrice,
      this.paymentMethod,
      this.paymentDone,
      this.orderStatus,
      this.orderTime});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    customer = json['customer'] != null
        ? new UserModel.fromJson(json['customer'])
        : null;
    if (json['items'] != null) {
      items = <CartDataModel>[];
      json['items'].forEach((v) {
        items!.add(CartDataModel.fromJson(v));
      });
    }
    deliveryAddress = json['deliveryAddress'];
    totalPrice = json['totalPrice'];
    paymentMethod = json['paymentMethod'];
    paymentDone = json['paymentDone'];
    orderStatus = json['orderStatus'];
    orderTime = json['orderTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderId'] = orderId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['deliveryAddress'] = deliveryAddress;
    data['totalPrice'] = totalPrice;
    data['paymentMethod'] = paymentMethod;
    data['paymentDone'] = paymentDone;
    data['orderStatus'] = orderStatus;
    data['orderTime'] = orderTime;
    return data;
  }
}
