import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:product_listing_app/api_services/urls.dart';
import 'package:product_listing_app/view/home_screen/models/banner_model.dart';
import 'package:product_listing_app/view/home_screen/models/product_list_model.dart';
import 'package:product_listing_app/view/name_screen/models/register_model.dart';
import '../profile/models/profile_model.dart';
import '../utils/widgets/extracted_widgets.dart';
import '../utils/widgets/user_data.dart';
import '../view/login_screen/model/login_model.dart';
import '../wishlist/models/wishlist_model.dart';

class ApiServices {
  static final Dio _dio = Dio();

  static Future verifyUser({required Map<String, dynamic> body}) async {
    var response = await _dio.post(
      ApiUrls.verifyUser,
      data: jsonEncode(body),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return VerifyUserModel.fromJson(response.data);
    } else {
      showToast(msg: 'Something went wrong');
      throw Exception(response.data);
    }
  }

  static Future register({required Map<String, dynamic> body}) async {
    var response = await _dio.post(
      ApiUrls.loginRegister,
      data: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else {
      showToast(msg: 'Something went wrong');
      throw Exception(response.data);
    }
  }

  static Future<List<ProductListModel>> getProducts() async {
    var response = await _dio.get(ApiUrls.productList,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
        ));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data;
      return jsonResponse
          .map((item) => ProductListModel.fromJson(item))
          .toList();
    } else {
      showToast(msg: 'Something went wrong');

      throw Exception(response.data);
    }
  }

  static Future<List<BannerListModel>> getBanners() async {
    var response = await _dio.get(
      ApiUrls.banner,
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data;
      return jsonResponse
          .map((item) => BannerListModel.fromJson(item))
          .toList();
    } else {
      showToast(msg: 'Something went wrong');

      throw Exception(response.data);
    }
  }

  static Future<List<ProductListModel>> searchItems(
      {required Map<String, dynamic> body}) async {
    var response = await _dio.post(ApiUrls.productSearch,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data;
      return jsonResponse
          .map((item) => ProductListModel.fromJson(item))
          .toList();
    } else if (response.statusCode == 400) {
      return [];
    } else {
      throw Exception(response.data);
    }
  }

  static Future<List<WishlistModel>> getWishList() async {
    var response = await _dio.get(
      ApiUrls.wishList,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = response.data;
      return jsonResponse.map((item) => WishlistModel.fromJson(item)).toList();
    } else {
      showToast(msg: 'Something went wrong');

      throw Exception(response.data);
    }
  }

  static Future<String> addOrRemoveWishlist(
      {required Map<String, dynamic> body}) async {
    var response = await _dio.post(
      ApiUrls.addOrRemoveWishList,
      data: jsonEncode(body),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data["message"];
    } else {
      showToast(msg: 'Something went wrong');

      throw Exception(response.data);
    }
  }

  static Future<ProfileModel> getProfileData() async {
    var response = await _dio.get(
      ApiUrls.profile,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      ),
    );

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      showToast(msg: 'Something went wrong');

      throw Exception(response.data);
    }
  }
}
