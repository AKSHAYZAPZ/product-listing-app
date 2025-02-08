import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/product_grid.dart';

import '../../../network_controller/nework_controller.dart';
import '../../utils/widgets/shimmer_container.dart';
import '../controller/wishlist_controller.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (networkController.isConnected.value) {
        WishListController wishListController = Get.put(WishListController());

        return Scaffold(
          backgroundColor: ColorConstant.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.textBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: wishListController.isLoading.value
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ShimmerContainer(
                                                width: size.width,
                                                height: 110,
                                                borderRadius: 8),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ShimmerContainer(
                                                      width: size.width * 0.1,
                                                      height: 15,
                                                      borderRadius: 5),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  ShimmerContainer(
                                                      width: size.width * 0.1,
                                                      height: 15,
                                                      borderRadius: 5),
                                                ],
                                              ),
                                              const Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      color: ColorConstant
                                                          .shadowColor,
                                                      size: 16),
                                                  ShimmerContainer(
                                                      width: 15,
                                                      height: 15,
                                                      borderRadius: 5),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          ShimmerContainer(
                                              width: size.width * 0.2,
                                              height: 10,
                                              borderRadius: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: ColorConstant.white,
                                          size: 18,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : wishListController.wishlistModel.isEmpty
                            ? const Center(
                                child: Text("No products found"),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.7,
                                  ),
                                  itemCount:
                                      wishListController.wishlistModel.length,
                                  itemBuilder: (context, index) {
                                    return ProductGrid(
                                      productId: wishListController
                                          .wishlistModel[index].id!
                                          .toString(),
                                      productImage: wishListController
                                              .wishlistModel[index].images?[0]
                                              .toString() ??
                                          '',
                                      productName: wishListController
                                              .wishlistModel[index].name ??
                                          '',
                                      price: wishListController
                                          .wishlistModel[index].salePrice
                                          .toString(),
                                      cutPrice: wishListController
                                          .wishlistModel[index].mrp
                                          .toString(),
                                      isWishList: true,
                                      rating: wishListController
                                          .wishlistModel[index].avgRating
                                          .toString(),
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: ColorConstant.appBlue,
                                      ),
                                      onFavPressed: () => wishListController
                                          .addOrRemoveWishlist(
                                        productId: wishListController
                                            .wishlistModel[index].id
                                            .toString(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}
