import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/features/shop/models/cart_model.dart';
import 'package:pizza/utils/constants/colors.dart';
import 'package:pizza/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class AdditionalIngredientsTile extends StatelessWidget {
  AdditionalIngredientsTile(
      {super.key,
      required this.ingredient,
      required this.item,
      required this.updatePrice});

  Map ingredient;
  CartItemModel item;
  RxBool selected = false.obs;
  RxInt updatePrice;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        updatePrice.value++;
        if (selected.value) {
          selected.value = !selected.value;
          item.additionalIngredients.remove(ingredient['Name']);
        } else {
          selected.value = !selected.value;
          item.additionalIngredients.add(ingredient['Name']);
        }
      },
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Container(
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
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadiusMd),
                      color: AppColors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                        height: 60, width: 60, imageUrl: ingredient['Image']),
                  ),
                ),
                const SizedBox(
                  width: AppSizes.sm * 1.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      ingredient['Name'],
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      '\$${ingredient['Price']}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 17),
                    )
                  ],
                ),
                const Spacer(),
                Obx(() {
                  selected.value =
                      item.additionalIngredients.contains(ingredient['Name']);
                  return selected.value
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Iconsax.tick_circle,
                            size: 30,
                          ),
                        )
                      : const SizedBox();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
