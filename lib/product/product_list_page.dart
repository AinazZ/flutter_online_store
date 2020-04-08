import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product/product_api.dart';
import 'package:flutteronlinestore/product/product.dart';
import 'package:flutteronlinestore/product/product_list_view_item.dart';

class ProductListPage extends StatefulWidget {
  final int categoryId;
  final String title;

  ProductListPage(this.categoryId, this.title);

  @override
  State<StatefulWidget> createState() {
    return ProductListPageState();
  }
}

class ProductListPageState extends State<ProductListPage> {
  List<Product> products;
  var productApi = ProductApi();

  ProductListPageState({this.products});

  @override
  void initState() {
    super.initState();
    loadProducts(widget.categoryId);
  }

  void loadProducts(int categoryId) async {
    products = await productApi.loadProducts(categoryId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var length = products.length;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: length,
          itemBuilder: (context, index) {
            return ProductListViewItem(index, products);
          },
        ),
    );
  }
}
