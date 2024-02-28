class Product {
  String? id;
  String? productName;
  String? productDescription;
  String? productShowImage;
  List<String>? productImage;
  String? productUnit;
  String? productPrice;
  String? productStock;
  String? nutrition;
  double? rating;

  Product(
      {this.id,
      this.productName,
      this.productDescription,
      this.productShowImage,
      this.productImage,
      this.productUnit,
      this.productPrice,
      this.productStock,
      this.nutrition,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    productShowImage = json['productShowImage'];
    productImage = json['productImage'].cast<String>();
    productUnit = json['productUnit'];
    productPrice = json['productPrice'];
    productStock = json['productStock'];
    nutrition = json['nutrition'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['productDescription'] = productDescription;
    data['productShowImage'] = productShowImage;
    data['productImage'] = productImage;
    data['productUnit'] = productUnit;
    data['productPrice'] = productPrice;
    data['productStock'] = productStock;
    data['nutrition'] = nutrition;
    data['rating'] = rating;
    return data;
  }
}
