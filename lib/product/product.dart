class Product {
  final String title;
  final num price;
  final String imageUrl;

  Product({
    this.title, 
    this.price, 
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String,
    );
  }
}