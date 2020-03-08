import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct(http.Client client) async {
  final response = await client.get('http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');

  return compute(parseProducts, response.body);
}

List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

class Product {
  final int productId;
  final String title;
  final int price;
  final String imageUrl;

  Product({this.productId, this.title, this.price, this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }
}

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Список продуктов';

    return MaterialApp(
      title: appTitle,
      home: ProductPage(title: appTitle),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String title;

  ProductPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchProduct(http.Client()),
        builder: (context, snapshot){
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
            ? ProductList(products: snapshot.data)
            : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(products[index].imageUrl),
          title: Text('${products[index].title}'),
          subtitle: Text('${products[index].price}'),
        );
      }
    );
  }
}