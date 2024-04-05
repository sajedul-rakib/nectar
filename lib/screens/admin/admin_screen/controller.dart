import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/model/Product.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/widgets/snack_bar.dart';
import 'package:nectar/share/save_data.dart';

class AdminScreenController extends GetxController {
//firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //firebase storage
  String? _unitName;
  String? _category;
  String? _tagName;
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _images = [];
  XFile? _slideImage;
  final List<String> _imageAddress = [];

  //text editing controller
  final TextEditingController _productNameETController =
      TextEditingController();
  final TextEditingController _productDetailETController =
      TextEditingController();
  final TextEditingController _productQuantityETController =
      TextEditingController();
  final TextEditingController _productPriceETController =
      TextEditingController();
  final TextEditingController _productNutritionETController =
      TextEditingController();

  //get
  String? get unitName => _unitName;
  List<XFile> get productImages => _images;
  XFile? get slideImages => _slideImage;
  String? get category => _category;
  String? get tagName => _tagName;

  TextEditingController get productNameETController => _productNameETController;
  TextEditingController get productDetailETController =>
      _productDetailETController;
  TextEditingController get productQuantityETController =>
      _productQuantityETController;
  TextEditingController get productPriceETController =>
      _productPriceETController;
  TextEditingController get productNutritionETController =>
      _productNutritionETController;

  void changeUnit(String unit) {
    _unitName = unit;
    update();
  }

  void changeTag(String tag) {
    _tagName = tag;
    update();
  }

  void changeCategory(String category) {
    _category = category;
    update();
  }

  Future<void> logOut() async {
    SaveData.clearData();
    await _auth.signOut();
    Get.offAllNamed(RouteName.LOGIN_SCREEN);
    snackBar(
        title: "Log out Successfully",
        message: "Admin log out successfully",
        contentType: ContentType.success,
        context: Get.key.currentContext!);
  }

//pick product images from gallery
  void pickImages() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (pickedFile.path.isNotEmpty) {
        _images.add(pickedFile);
        update();
      }
    }
  }

  //pick slide image
  void pickSlideImage() async {
    _slideImage = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (_slideImage != null) {
      _slideImage = _slideImage;
      update();
    }
  }

  //upload slider/banner
  Future<void> uploadSlider() async {}

  //upload product image in firebase firesotre
  Future<bool> uploadImages() async {
    final ref = FirebaseStorage.instance.ref('product/productImages');
    var uploadTask;
    for (var imgFile in _images) {
      final file = File(imgFile.path);
      final store = ref.child(imgFile.name);
      uploadTask = store.putFile(file);

      final snapshot = await uploadTask.whenComplete(() => null);

      final urlDownload = await snapshot.ref.getDownloadURL();
      _imageAddress.add(urlDownload);
    }
    if (uploadTask.snapshot == TaskState.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> uploadProducts({
    required String productName,
    required String productDetails,
    required int productQuantiy,
    required String productPrice,
    required String nutrition,
  }) async {
    await uploadImages().then((value) async {
      Product product = Product(
        productName: productName,
        productDescription: productDetails,
        productImage: _imageAddress,
        productPrice: productPrice,
        productShowImage: _imageAddress.first,
        productStock: productQuantiy,
        productUnit: _unitName,
        category: _category?.split(" ").join(''),
        tag: _tagName?.split(" ").join(''),
        nutrition: nutrition,
        brandName: null,
        rating: 0.0,
      );
      await _firestore.collection('products').add(product.toJson());
      _imageAddress.clear();
      _images.clear();
      _category = null;
      _unitName = null;
      _tagName = null;
      _productNameETController.clear();
      _productDetailETController.clear();
      _productQuantityETController.clear();
      _productPriceETController.clear();
      _productNutritionETController.clear();
      update();
    });
  }
}
