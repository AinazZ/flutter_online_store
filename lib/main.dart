import 'package:flutter/material.dart';

import 'package:flutteronlinestore/product_list_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Store',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ProductListPage(),
    );
  }
}