class Category {
  final int categoryId;
  final String title;
  final String imageurl;

  Category({
    this.categoryId,
    this.title,
    this.imageurl
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      imageurl: json['imageurl'] as String,);
  }
}