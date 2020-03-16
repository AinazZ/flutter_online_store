class Product {
  String title;
  num price;
  String imageurl;

  Product({this.title, this.price, this.imageurl});

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     title: json['title'],
  //     price: json['price'],
  //     imageurl: json['imageurl'],
  //   );
  // }
}