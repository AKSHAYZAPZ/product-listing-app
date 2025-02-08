import 'dart:convert';

List<WishlistModel> wishlistModelFromJson(String str) =>
    List<WishlistModel>.from(
        json.decode(str).map((x) => WishlistModel.fromJson(x)));

String wishlistModelToJson(List<WishlistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistModel {
  final int? id;

  final bool? inWishlist;
  final int? avgRating;
  final List<String>? images;

  final int? salePrice;

  final String? name;

  final int? mrp;

  final String? discount;

  WishlistModel({
    this.id,
    this.inWishlist,
    this.avgRating,
    this.images,
    this.salePrice,
    this.name,
    this.mrp,
    this.discount,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json["id"],
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        salePrice: json["sale_price"],
        name: json["name"],
        mrp: json["mrp"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "in_wishlist": inWishlist,
        "avg_rating": avgRating,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "sale_price": salePrice,
        "name": name,
        "mrp": mrp,
        "discount": discount,
      };
}
