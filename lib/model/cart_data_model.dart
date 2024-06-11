class CartDataModel {
  String? productShowImage;
  String? brandName;
  double? rating;
  int? productStock;
  double? discount;
  String? productUnit;
  String? userId;
  String? productName;
  String? productCategory;
  List<String>? productImages;
  String? nutrition;
  String? tag;
  String? id;
  String? productDescription;
  double? productPrice;
  int? totalOrderProduct;

  CartDataModel(
      {this.productShowImage,
      this.brandName,
      this.rating,
      this.productStock,
      this.discount,
      this.productUnit,
      this.userId,
      this.productName,
      this.productCategory,
      this.productImages,
      this.nutrition,
      this.tag,
      this.id,
      this.productDescription,
      this.productPrice,
      this.totalOrderProduct});

  CartDataModel.fromJson(Map<String, dynamic> json) {
    productShowImage = json['productShowImage'];
    brandName = json['brandName'];
    rating = json['rating'];
    productStock = json['productStock'];
    discount = json['discount'];
    productUnit = json['productUnit'];
    userId = json['userId'];
    productName = json['productName'];
    productCategory = json['productCategory'];
    productImages = json['productImages'].cast<String>();
    nutrition = json['nutrition'];
    tag = json['tag'];
    id = json['id'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    totalOrderProduct = json['totalOrderProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productShowImage'] = productShowImage;
    data['brandName'] = brandName;
    data['rating'] = rating;
    data['productStock'] = productStock;
    data['discount'] = discount;
    data['productUnit'] = productUnit;
    data['userId'] = userId;
    data['productName'] = productName;
    data['productCategory'] = productCategory;
    data['productImages'] = productImages;
    data['nutrition'] = nutrition;
    data['tag'] = tag;
    data['id'] = id;
    data['productDescription'] = productDescription;
    data['productPrice'] = productPrice;
    data['totalOrderProduct'] = totalOrderProduct;
    return data;
  }
}
