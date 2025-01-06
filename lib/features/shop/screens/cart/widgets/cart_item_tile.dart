// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pizza/common/widgets/texts/product_price_text.dart';
import 'package:pizza/features/shop/models/cart_model.dart';
import 'package:pizza/features/shop/screens/cart/widgets/add_remove_widget_cart.dart';
import 'package:pizza/utils/constants/colors.dart';
import 'package:pizza/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class CartItemTile extends StatelessWidget {
  CartItemModel cartItem;

  CartItemTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    color: dark ? AppColors.darkerGrey : Colors.grey,
                    offset: const Offset(2, 2),
                    blurRadius: 2)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.sm, horizontal: AppSizes.md / 1.5),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadiusMd),
                          color: AppColors.grey),
                      child: CachedNetworkImage(imageUrl: cartItem.image)),
                  const SizedBox(
                    width: AppSizes.sm * 1.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        cartItem.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        'Size: ${cartItem.size}"',
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      ProductPriceText(price: '${cartItem.price}'),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 4,
            child: CartAddRemoveWidget(
              item: cartItem,
              size: 32,
              addOn: false,
            ),
          )
        ],
      ),
    );
  }
}
