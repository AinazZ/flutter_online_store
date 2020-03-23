class Category {
  final String title;
  final String imageurl;

  Category({
    this.title,
    this.imageurl
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'] as String,
      imageurl: json['imageurl'] as String,);
  }
}