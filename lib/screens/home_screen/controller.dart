import 'package:get/get.dart';

import '../../model/Product.dart';

class HomeScreenController extends GetxController {
  int _currentBanner = 0;

  int get currentBanner => _currentBanner;
  List<String> carousel_data = [
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
    'assets/images/apple.png',
  ];

  List<Product> productData = [
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName:
            "Organic Red Apple Organic Red Apple Organic Red Apple Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm',
        productStock: '12kg'),
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName: "Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm'),
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName: "Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm'),
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName: "Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm'),
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName: "Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm'),
    Product(
        productShowImage: 'assets/images/apple.png',
        productImage: ['assets/images/apple.png'],
        productName: "Organic Red Apple",
        productDescription:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        productUnit: '1kg',
        rating: 4.2,
        productPrice: '12\$',
        nutrition: '120gm'),
  ];

  void changeBanner(int index) {
    _currentBanner = index;
    update();
  }
}
