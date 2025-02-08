import 'package:get/get.dart';
import 'package:product_listing_app/api_services/api_services.dart';
import 'package:product_listing_app/utils/widgets/extracted_widgets.dart';

import '../models/wishlist_model.dart';

class WishListController extends GetxController {
  RxList<WishlistModel> wishlistModel = <WishlistModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  getWishlist() async {
    try {
      isLoading.value = true;
      wishlistModel.value = await ApiServices.getWishList();
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  addOrRemoveWishlist({required String productId}) async {
    try {
      String response = await ApiServices.addOrRemoveWishlist(
          body: {"product_id": productId});
      wishlistModel.removeWhere((item) => item.id.toString() == productId);
      showToast(msg: response);
      update();
    } catch (e) {
      //
    }
  }

  @override
  void onInit() {
    getWishlist();
    super.onInit();
  }
}
