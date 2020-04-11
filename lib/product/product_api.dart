import 'dart:async';

import 'package:flutteronlinestore/common/base_api.dart';
import 'package:flutteronlinestore/product/product.dart';

class ProductApi extends BaseApi {
  Future<List<Product>> loadProducts(int categoryId) async {
    var relativePath = "common/product/list";

    final jsonResponse = await get(relativePath, categoryId);

    return _parseProducts(jsonResponse);
  }

  List<Product> _parseProducts(jsonResponse) {
    if (!(jsonResponse is Map<String, dynamic>)) {
      throw Exception('Fail');
    } else {
      var jsonData = jsonResponse["data"];
      
      final productsList = jsonData.cast<Map<String, dynamic>>();

      return productsList.map<Product>((json) => Product.fromJson(json)).toList();
    }
  }
}