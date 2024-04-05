class Product {
  String? brandName;
  String? category;
  String? id;
  String? nutrition;
  String? productDescription;
  List<String>? productImage;
  String? productName;
  String? productPrice;
  String? productShowImage;
  int? productStock;
  String? productUnit;
  double? rating;
  String? tag;

  Product(
      {this.brandName,
      this.category,
      this.id,
      this.nutrition,
      this.productDescription,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productShowImage,
      this.productStock,
      this.productUnit,
      this.rating,
      this.tag});

  Product.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    category = json['category'];
    id = json['id'];
    nutrition = json['nutrition'];
    productDescription = json['productDescription'];
    productImage = json['productImage'].cast<String>();
    productName = json['productName'];
    productPrice = json['productPrice'];
    productShowImage = json['productShowImage'];
    productStock = json['productStock'];
    productUnit = json['productUnit'];
    rating = json['rating'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brandName'] = brandName;
    data['category'] = category;
    data['id'] = id;
    data['nutrition'] = nutrition;
    data['productDescription'] = productDescription;
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productShowImage'] = productShowImage;
    data['productStock'] = productStock;
    data['productUnit'] = productUnit;
    data['rating'] = rating;
    data['tag'] = tag;
    return data;
  }
}
