import 'package:nectar/model/product.dart';

class UserData {
  String? fullName;
  String? email;
  String? address;
  String? token;
  String? profilePic;
  String? phoneNumber;
  List<Product>? cartList;
  List<Product>? favouriteList;
  String? order;

  UserData(
      {this.fullName,
      this.email,
      this.address,
      this.token,
      this.profilePic,
      this.phoneNumber,
      this.cartList,
      this.favouriteList,
      this.order});

  UserData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    address = json['address'];
    token = json['token'];
    profilePic = json['profile_pic'];
    phoneNumber = json['phone_number'];
    if (json['cart_list'] != null) {
      cartList = <Product>[];
      json['cart_list'].forEach((v) {
        cartList!.add(Product.fromJson(v));
      });
    }
    if (json['favourite_list'] != null) {
      favouriteList = <Product>[];
      json['favourite_list'].forEach((v) {
        favouriteList!.add(Product.fromJson(v));
      });
    }
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['address'] = address;
    data['token'] = token;
    data['profile_pic'] = profilePic;
    data['phone_number'] = phoneNumber;
    if (cartList != null) {
      data['cart_list'] = cartList!.map((v) => v.toJson()).toList();
    }
    if (favouriteList != null) {
      data['favourite_list'] = favouriteList!.map((v) => v.toJson()).toList();
    }
    data['order'] = order;
    return data;
  }
}
