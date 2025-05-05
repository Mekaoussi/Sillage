class FetchedDataModel {
  final List<Product> homePopularProducts;
  final List<Product> homeNewestProducts;
  final List<Product> popularProducts;
  final List<Product> menProducts;
  final List<Product> womenProducts;
  final List<Product> favoritesProducts;

  FetchedDataModel(
      {required this.homePopularProducts,
      required this.homeNewestProducts,
      required this.popularProducts,
      required this.menProducts,
      required this.womenProducts,
      required this.favoritesProducts});

  factory FetchedDataModel.fromJson(Map<String, dynamic> json) {
    return FetchedDataModel(
      homePopularProducts: List<Product>.from(
          json['home']['popular'].map((data) => Product.fromJson(data))),
      homeNewestProducts: List<Product>.from(
          json['home']['newest'].map((data) => Product.fromJson(data))),
      popularProducts: List<Product>.from(
          json['popular'].map((data) => Product.fromJson(data))),
      menProducts:
          List<Product>.from(json['men'].map((data) => Product.fromJson(data))),
      womenProducts: List<Product>.from(
          json['women'].map((data) => Product.fromJson(data))),
      favoritesProducts: List<Product>.from(
          json['favorites'].map((data) => Product.fromJson(data))),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String brand;
  final int price;
  final String description;
  final String concentration;
  final String category;
  final String imageURL;
  final int ratingCount;
  final String ratingScore;
  // final bool isFav;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.concentration,
    required this.category,
    required this.imageURL,
    required this.ratingCount,
    required this.ratingScore,
    // required this.isFav
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      description: json['description'],
      concentration: json['concentration'],
      category: json['category'],
      imageURL: json['imageURL'],
      ratingCount: json['ratingCount'],
      ratingScore: json['ratingScore'],
      // isFav: json['isFav'],
    );
  }
}
