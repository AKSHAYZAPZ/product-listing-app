import 'package:flutter/material.dart';
import 'package:product_listing_app/utils/color_constants.dart';
import 'package:product_listing_app/utils/widgets/custom_text.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid(
      {super.key,
      required this.productId,
      required this.productImage,
      required this.productName,
      required this.price,
      required this.cutPrice,
      required this.isWishList,
      required this.rating,
      required this.onFavPressed,
      required this.icon});
  final String productId;

  final String productImage;
  final String productName;
  final String price;
  final String cutPrice;
  final bool isWishList;
  final String rating;
  final void Function()? onFavPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      productImage,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '₹$cutPrice',
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorConstant.iconColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        HeeboFontText(
                          text: '₹$price',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.appBlue,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: ColorConstant.starColor, size: 16),
                        HeeboFontText(
                          text: rating.toString(),
                          color: ColorConstant.textBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                HeeboFontText(
                  text: productName,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.black,
                  maxLines: 1,
                ),
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
                icon: icon,
                onPressed: onFavPressed),
          ),
        ),
      ],
    );
  }
}
