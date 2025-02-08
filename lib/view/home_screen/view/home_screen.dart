import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/custom_text.dart';
import 'package:product_listing_app/utils/widgets/product_grid.dart';
import 'package:product_listing_app/utils/widgets/shimmer_container.dart';
import 'package:product_listing_app/view/home_screen/controller/home_controller.dart';
import '../../../network_controller/nework_controller.dart';
import '../../../utils/widgets/exit_dialog.dart';
import '../../../utils/widgets/search_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (networkController.isConnected.value) {
        HomeController homeController = Get.put(HomeController());
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            exitDialogue(context);
          },
          child: Scaffold(
            backgroundColor: ColorConstant.white,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              toolbarHeight: 100,
              backgroundColor: ColorConstant.white,
              automaticallyImplyLeading: false,
              title: AppShadowTextFormField(
                controller: homeController.searchController,
                hint: "Search",
                radius: 20,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                          child: const VerticalDivider(
                            width: 5,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        GestureDetector(
                            onTap: () {
                              homeController.searchProduct();
                            },
                            child: const Icon(Icons.search)),
                      ],
                    ),
                  ),
                ),
                onChanged: (value) => homeController.searchProduct(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeController.isBannerFetching.value
                      ? ShimmerContainer(
                          width: Get.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          borderRadius: 10)
                      : SizedBox(
                          width: double.infinity,
                          child: CarouselSlider.builder(
                            carouselController:
                                homeController.carouselController,
                            itemCount: homeController.bannerListModel!.length,
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.2,
                              enlargeCenterPage: false,
                              viewportFraction: 1.0,
                              autoPlay: true,
                              onPageChanged: homeController.onPageChanged,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              final banner =
                                  homeController.bannerListModel![index].image;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  banner,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  homeController.isBannerFetching.value
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              homeController.bannerListModel!.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: homeController.currentPage.value == index
                                  ? 24
                                  : 8,
                              decoration: BoxDecoration(
                                color: homeController.currentPage.value == index
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }),
                        ),
                  const SizedBox(height: 10),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: HeeboFontText(
                        text: 'Popular Product',
                        fontSize: 15,
                        color: ColorConstant.textBlue,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 10),
                  Expanded(
                    child: homeController.isProductFetching.value
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
                                  const Positioned(
                                    top: 10,
                                    right: 10,
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child:Icon(
                                        Icons.favorite,
                                        color: ColorConstant.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : homeController.productListModel.isEmpty
                            ? const Center(
                                child: Text("No Products Found"),
                              )
                            : GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount:
                                    homeController.productListModel.length,
                                itemBuilder: (context, index) {
                                  return Obx(() {
                                    return ProductGrid(
                                      productId: homeController
                                          .productListModel[index].id
                                          .toString(),
                                      productImage: homeController
                                          .productListModel[index].images[0],
                                      productName: homeController
                                          .productListModel[index].name,
                                      price: homeController
                                          .productListModel[index].salePrice
                                          .toString(),
                                      cutPrice: homeController
                                          .productListModel[index].mrp
                                          .toString(),
                                      isWishList: homeController
                                          .productListModel[index].inWishlist,
                                      rating: homeController
                                          .productListModel[index].avgRating
                                          .toString(),
                                      icon: homeController
                                              .productListModel[index]
                                              .inWishlist
                                          ? const Icon(
                                              Icons.favorite,
                                              color: ColorConstant.appBlue,
                                            )
                                          : const Icon(
                                              Icons.favorite_border,
                                              color: ColorConstant.white,
                                            ),
                                      onFavPressed: () =>
                                          homeController.addOrRemoveWishlist(
                                              productId: homeController
                                                  .productListModel[index].id
                                                  .toString()),
                                    );
                                  });
                                },
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
