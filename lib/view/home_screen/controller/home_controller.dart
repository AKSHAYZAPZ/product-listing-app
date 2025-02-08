import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/api_services/api_services.dart';
import 'package:product_listing_app/utils/widgets/extracted_widgets.dart';
import 'package:product_listing_app/view/home_screen/models/banner_model.dart';
import 'package:product_listing_app/view/home_screen/models/product_list_model.dart';

class HomeController extends GetxController {
  RxBool isProductFetching = false.obs, isBannerFetching = false.obs;

  TextEditingController searchController = TextEditingController();
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  Timer? autoSlideTimer;
  RxList<ProductListModel> productListModel = <ProductListModel>[].obs;

  List<BannerListModel>? bannerListModel;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  void onPageChanged(int index, _) {
    currentPage.value = index;
  }

  getProductList() async {
    try {
      isProductFetching.value = true;
      productListModel.value = await ApiServices.getProducts();
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      isProductFetching.value = false;
    }
  }

  getBannerImages() async {
    try {
      isBannerFetching.value = true;
      bannerListModel = await ApiServices.getBanners();
    } catch (e) {
      showToast(msg: 'Something went wrong');
      //
    } finally {
      isBannerFetching.value = false;
    }
  }

  searchProduct() async {
    try {
      isProductFetching.value = true;
      productListModel.value =
          await ApiServices.searchItems(body: {"query": searchController.text});
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      isProductFetching.value = false;
    }
  }

  Future<void> addOrRemoveWishlist({required String productId}) async {
    try {
      String response = await ApiServices.addOrRemoveWishlist(
          body: {"product_id": productId});

      var product = productListModel.value.firstWhere(
        (item) => item.id == int.parse(productId),
      );

      product.inWishlist = !product.inWishlist;

      showToast(msg: response);
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {}
  }

  @override
  void onInit() {
    getProductList();
    getBannerImages();
    super.onInit();
  }
}
