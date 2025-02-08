import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  int id;
  bool inWishlist;
  int avgRating;
  List<String> images;
  int salePrice;

  String name;

  int mrp;

  ProductListModel({
    required this.id,
    required this.inWishlist,
    required this.avgRating,
    required this.images,
    required this.salePrice,
    required this.name,
    required this.mrp,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        id: json["id"],
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: List<String>.from(json["images"].map((x) => x)),
        salePrice: json["sale_price"],
        name: json["name"],
        mrp: json["mrp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "in_wishlist": inWishlist,
        "avg_rating": avgRating,
        "images": List<dynamic>.from(images.map((x) => x)),
        "sale_price": salePrice,
        "name": name,
        "mrp": mrp,
      };
}
