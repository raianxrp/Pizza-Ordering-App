import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/features/shop/controllers/cart_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor != null
                  ? iconColor
                  : dark
                      ? AppColors.white
                      : AppColors.dark,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
                color: Colors.red, //.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Obx(
              () => Text(
                '${controller.noOfCartItems}',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.apply(color: AppColors.white, fontSizeFactor: 0.8),
              ),
            )),
          ),
        )
      ],
    );
  }
}
