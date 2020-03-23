import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return _buildListItem(product);
      },
    );
  }

  ListTile _buildListItem(product) {
    return ListTile(
      title: Text(product.title),
      leading: Image.network(product.imageurl),
      trailing: Text(product.price.toString()),
    );
  }
}
