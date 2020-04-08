import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutteronlinestore/base_api.dart';
import 'package:flutteronlinestore/category/category.dart';

class CategoryApi extends BaseApi {
  Future<List<Category>> loadCategories() async {
    var relativePath = "common/category/list";
    var categoryId;
    var apiUrl = getApiUrl(relativePath, categoryId);

    final response = await http.get(apiUrl);

    if(response.statusCode == 200) {
      return _parseCategories(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  List<Category> _parseCategories(String responseBody) {
    var jsonResponse = json.decode(responseBody);
    if (!(jsonResponse is Map<String, dynamic>)) {
      throw Exception('Fail');
    } else {
      var jsonData = jsonResponse["data"];
      var jsonCategories = jsonData["categories"];

      final categories = jsonCategories.cast<Map<String, dynamic>>();

      return categories.map<Category>((json) => Category.fromJson(json)).toList();
    }
  }
}