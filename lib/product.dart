class Product {
  final String title;
  final num price;
  final String imageurl;

  Product({
    this.title, 
    this.price, 
    this.imageurl
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      price: json['price'] as num,
      imageurl: json['imageurl'] as String,
    );
  }
}