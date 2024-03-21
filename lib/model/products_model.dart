class ProductsModel {
  int? id;
  String? title;
  // double? price;
  String? description;
  String? category;
  String? image;

  ProductsModel(
      {this.id,
      this.title,
      // this.price,
      this.description,
      this.category,
      this.image});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    // price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }
}
