import 'dart:async';

import 'package:flutteronlinestore/category/category.dart';
import 'package:flutteronlinestore/common/base_api.dart';

class CategoryApi extends BaseApi {
  Future<List<Category>> loadCategories() async {
    var relativePath = "common/category/list";
    var categoryId;

    final jsonResponse = await get(relativePath, categoryId);

    return _parseCategories(jsonResponse);
  }

  List<Category> _parseCategories(jsonResponse) {
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