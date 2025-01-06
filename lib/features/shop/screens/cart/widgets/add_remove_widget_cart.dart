// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:pizza/features/shop/controllers/cart_controller.dart';
import 'package:pizza/features/shop/models/cart_model.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartAddRemoveWidget extends StatelessWidget {
  const CartAddRemoveWidget({
    Key? key,
    required this.item,
    this.size = 32,
    required this.addOn,
  }) : super(key: key);

  final CartItemModel item;
  final double size;
  final bool addOn;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // boxShadow: const [
          //   BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 2)
          // ],
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                addOn
                    ? controller.removeAddOnFromCart(item)
                    : controller.removeOneFromCart(item);
              },
              child: CircularIcon(
                icon: Iconsax.minus,
                width: size,
                height: size,
                size: AppSizes.md,
                color: dark ? AppColors.white : AppColors.black,
                backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Text('${item.amount}',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: AppSizes.sm),
            GestureDetector(
              onTap: () {
                addOn
                    ? controller.addOnToCart(item)
                    : controller.addOneToCart(item);
              },
              child: CircularIcon(
                icon: Iconsax.add,
                width: size,
                height: size,
                size: AppSizes.iconSm,
                color: AppColors.white,
                backgroundColor: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
