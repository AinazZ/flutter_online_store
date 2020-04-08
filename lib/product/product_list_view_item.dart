import 'package:flutter/material.dart';

class ProductListViewItem extends StatelessWidget {
  final int index;
  final dynamic products;

  ProductListViewItem(this.index, this.products);

  @override
  Widget build(BuildContext context) {
    var product = products[index];

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(product.imageUrl),
            Text(product.title),
            Text(product.price.toString()),
          ],
        ),
      ],
    );
  }
}