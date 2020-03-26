import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutteronlinestore/product.dart';

class ProductApi {
  Future<List<Product>> loadProducts() async {
    final response = await http.get(
        'http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');

    if (response.statusCode == 200) {
      return compute(parseProducts, response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  static List<Product> parseProducts(String responseBody) {
    var jsonResponse = json.decode(responseBody);
    if (!(jsonResponse is Map<String, dynamic>)) {
      throw Exception('Fail');
    } else {
      var jsonData = jsonResponse["data"];
      
      final productsList = jsonData.cast<Map<String, dynamic>>();

      return productsList.map<Product>((json) => Product.fromJson(json)).toList();
    }
  }
}
