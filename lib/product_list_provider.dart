import 'package:flutter/cupertino.dart';
import 'package:product_list/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final List<ProductModel> _productsList = [
    ProductModel(
      id : 1,
      name: 'Samsung',
      price: '৳89,999',
      image: 'assets/images/samsung.jpg',
    ),
    ProductModel(
      id : 2,
      name: 'iPhone',
      price: '৳120,000',
      image: 'assets/images/iphone.png',
    ),
    ProductModel(
      id : 3,
      name: 'Nokia',
      price: '৳30,000',
      image: 'assets/images/nokia.png',
    ),
    ProductModel(
      id : 4,
      name: 'OPPO',
      price: '৳20,000',
      image: 'assets/images/oppo.png',
    ),
    ProductModel(
      id : 5,
      name: 'Samsung',
      price: '৳89,999',
      image: 'assets/images/samsung.jpg',
    ),
    ProductModel(
      id : 6,
      name: 'iPhone',
      price: '৳120,000',
      image: 'assets/images/iphone.png',
    ),
    ProductModel(
      id : 7,
      name: 'Nokia',
      price: '৳30,000',
      image: 'assets/images/nokia.png',
    ),
    ProductModel(
      id : 8,
      name: 'OPPO',
      price: '৳20,000',
      image: 'assets/images/oppo.png',
    ),
  ];

  final List<ProductModel> _cartList = [];

  List<ProductModel> get productsList => _productsList;

  int get cartItemCount => _cartList.length;

  List<ProductModel> get cartList => _cartList;

  void addToCart(ProductModel product){
    if(_cartList.contains(product)){
      return;
    }
    _cartList.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartList.remove(product);
    notifyListeners();
  }

  bool isProductInCart(ProductModel product) => _cartList.contains(product);
}