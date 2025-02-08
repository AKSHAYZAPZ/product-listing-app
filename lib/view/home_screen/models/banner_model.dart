import 'dart:convert';

List<BannerListModel> bannerListModelFromJson(String str) =>
    List<BannerListModel>.from(
        json.decode(str).map((x) => BannerListModel.fromJson(x)));

String bannerListModelToJson(List<BannerListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerListModel {
  int id;

  String name;
  String image;

  BannerListModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
