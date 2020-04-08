import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product/product_list_page.dart';

class CategoryListViewItem extends StatelessWidget {
  final int index;
  final dynamic categories;

  CategoryListViewItem(this.index, this.categories);

  @override
  Widget build(BuildContext context) {
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
          Image.network(
            category.imageUrl,
            width: 145,
            height: 145,
          ),
          Text(category.title),
        ],
      ),
    );
  }
}