import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutteronlinestore/base_api.dart';
import 'package:flutteronlinestore/product/product.dart';

class ProductApi extends BaseApi {
  Future<List<Product>> loadProducts(int categoryId) async {
    var relativePath = "common/product/list";
    var apiUrl = getApiUrl(relativePath, categoryId);

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      return _parseProducts(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  List<Product> _parseProducts(String responseBody) {
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
