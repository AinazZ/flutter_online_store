import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => _buildListItem(products, index),
    );
  }

  ListTile _buildListItem(products, index) {
    final product = products[index];

    return ListTile(
      title: Text(product.title),
      leading: Image.network(product.imageurl),
      trailing: Text(product.price.toString()),
    );
  }
}
