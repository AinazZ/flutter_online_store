class Category {
  final int categoryId;
  final String title;
  final String imageUrl;

  Category({
    this.categoryId,
    this.title,
    this.imageUrl
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,);
  }
}