import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutteronlinestore/product.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList>{
  List<Product> data = [];

  // @override
  // void initState() {
  //   super.initState();
  //   data = _loadData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Store'),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadData(),
      ),
    );
  }

  _loadData() async {
    final response = await http.get('http://ostest.whitetigersoft.ru/api/common/product/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');
    if (response.statusCode == 200) {
      //print(response.body);
      var allData = (json.decode(response.body) as Map)['data'] as Map<String, dynamic>;

      var productList = List<Product>();
      allData.forEach((String key, dynamic value) {
        var record = Product(
          title: value['title'],
          price: value['price'],
          imageurl: value['imageurl']
        );

        productList.add(record);
      });
      //return Product.fromJson(json.decode(response.body));
      
      setState(() {
        data = productList;
      });
    }
  }

  List<Widget> _buildList() {
    return data.map((Product products) => ListTile(
      title: Text(products.title),
      leading: Image.network(products.imageurl),
      trailing: Text(products.price.toString()),
    )).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }
}