import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProducts() async {
  final response = await http.get('http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');

  if (response.statusCode == 200) {
    return Product.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}

class Product {
  final int productId;
  final String title;
  final int price;
  final String imageUrl;

  Product({this.productId, this.title, this.price, this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super (key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список продуктов',
      home: Scaffold (
        appBar: AppBar(
          title: Text('Список продуктов'),
        ),
        body: FutureBuilder<Product>(
          future: futureProduct,
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(snapshot.data[index].imageUrl),
                    title: Text(snapshot.data[index].title),
                    //subtitle: Text('${products[index].price}'),
                  );
                }
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
}