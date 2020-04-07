import 'package:flutter/material.dart';

import 'package:flutteronlinestore/category/category_api.dart';
import 'package:flutteronlinestore/category/category.dart';
import 'package:flutteronlinestore/product/product_list_page.dart';

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
            return _buildGridItem(context, index, categories);
          },
        )
    );
  }

  Widget _buildGridItem(BuildContext context, int index, dynamic categories) {
    var category = categories[index];

    return GestureDetector(
      onTap: () {
        int categoryId = category.categoryId;
        String title = category.title;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListPage(categoryId, title),
            ),
        );
      },
      child: Column(
        children: <Widget>[
          Image.network(category.imageUrl),
          Text(category.title),
        ],
      ),
    );
  }
}
