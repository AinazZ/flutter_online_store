import 'package:flutter/material.dart';

class ProductListViewItem extends StatelessWidget {
  final int index;
  final dynamic products;

  ProductListViewItem(this.index, this.products);

  @override
  Widget build(BuildContext context) {
    var product = products[index];

    return ListTile(
      title: Text(product.title),
      leading: Image.network(product.imageUrl),
      trailing: Text(product.price.toString()),
    );
  }
}