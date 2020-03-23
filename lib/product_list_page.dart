import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product_api.dart';
import 'package:flutteronlinestore/product.dart';
import 'package:flutteronlinestore/product_list.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListPageState();
  }
}

class ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> products;
  var productApi = ProductApi();

  @override
  void initState() {
    super.initState();
    products = productApi.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Store'),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ProductList(products: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}