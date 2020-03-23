import 'package:flutter/material.dart';

import 'package:flutteronlinestore/category_api.dart';
import 'package:flutteronlinestore/category.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  Future<List<Category>> categories;
  var categoryApi = CategoryApi();

  @override
  void initState() {
    super.initState();
    categories = categoryApi.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    var length = categories.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Online Store'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(length, (index) {
          final category = categories[index];

          return _buildGridItem(category);
        }),
      ),
    );
  }

    _buildGridItem(category) {
    return Stack(
      children: <Widget>[
        Container(
          child: Text(category.title),
        ),
        Container(
          child: Image.network(category.imageurl),
        ),
      ],
    );
  }
}