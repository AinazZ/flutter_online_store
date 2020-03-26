import 'package:flutter/material.dart';

import 'package:flutteronlinestore/category_page.dart';
import 'package:flutteronlinestore/product_list_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => CategoryPage(),
        '/products':(BuildContext context) => ProductListPage()
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name.split('/');

        if (path[1] == "products") {
          return MaterialPageRoute(
            builder: (context) => ProductListPage(categoryId:path[2]),
            settings: routeSettings,
          );
        }
      },
    );
  }
}