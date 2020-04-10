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
            Image.network(
              product.imageUrl,
              width: 60,
              height: 60,
            ),
            Container(
              child: Text(product.title),
              width: 250,
              height: 60,
              alignment: Alignment.center,
            ),
            Container(
              child: Text(product.price.toString()),
              width: 50,
              height: 60,
              alignment: Alignment.center,
            ),
          ],
        ),
      ],
    );
  }
}