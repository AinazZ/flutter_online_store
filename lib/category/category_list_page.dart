import 'package:flutter/material.dart';

import 'package:flutteronlinestore/category/category_api.dart';
import 'package:flutteronlinestore/category/category.dart';
import 'package:flutteronlinestore/category/category_list_view_item.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryListPageState();
  }
}

class CategoryListPageState extends State<CategoryListPage> {
  List<Category> categories;
  var categoryApi = CategoryApi();
  int categoryId;

  CategoryListPageState({
    this.categories
  });

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    categories = await categoryApi.loadCategories();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var length = categories.length;

    return Scaffold(
        appBar: AppBar(
          title: Text('Каталог'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: length,
          itemBuilder: (context, index) {
            return CategoryListViewItem(index, categories);
          },
        )
    );
  }
}
