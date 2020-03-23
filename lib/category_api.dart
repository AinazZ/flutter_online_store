import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutteronlinestore/category.dart';

class CategoryApi {
  Future<List<Category>> loadCategories() async {
    final response = await http.get('http://ostest.whitetigersoft.ru/api/common/category/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');

    if(response.statusCode == 200) {
      return compute(parseCategories, response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static List<Category> parseCategories(String responseBody) {
    var jsonResponse = json.decode(responseBody);
    if (!(jsonResponse is Map<String, dynamic>)) {
      throw Exception('Fail');
    }
    var jsonData = jsonResponse["data"];
    var jsonCategories = jsonData["categories"];
    final categories = jsonCategories.cast<Map<String, dynamic>>();

    return categories.map<Category>((json) => Category.fromJson(json)).toList();
  }
 }