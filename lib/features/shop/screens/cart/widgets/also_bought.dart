import 'package:flutter/material.dart';
import 'package:pizza/common/widgets/texts/product_price_text.dart';
import 'package:pizza/features/shop/models/cart_model.dart';
import 'package:pizza/features/shop/screens/cart/widgets/add_remove_widget_cart.dart';
import 'package:pizza/utils/constants/colors.dart';
import 'package:pizza/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class AlsoBoughtTile extends StatelessWidget {
  AlsoBoughtTile({super.key, required this.item});

  CartItemModel item;
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 75,
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
                    child: Image.asset(
                      'assets/ingredients/garlic_sauce.png',
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.sm * 1.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Garlic Sauce',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      const ProductPriceText(price: '2.69'),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                  // const Spacer(),
                  // Column(
                  //   children: [
                  //     const Spacer(),
                  //     AddRemoveWidget(
                  //       size: 32,
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 4,
            child: CartAddRemoveWidget(
              size: 32,
              item: item,
              addOn: true,
            ),
          )
        ],
      ),
    );
  }
}
