import 'package:flutter/material.dart';

import 'package:flutteronlinestore/category/category_list_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryListPage(),

    );
  }
}