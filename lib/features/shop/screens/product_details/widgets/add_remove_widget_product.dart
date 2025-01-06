import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product_details_controller.dart';

class ProductAddRemoveWidget extends StatelessWidget {
  const ProductAddRemoveWidget({
    super.key,
    this.size = 32,
    required this.amount,
  });

  final RxInt amount;
  final double size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
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
                final x = controller.removeOne(amount.value);
                amount.value = x;
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
            Text('$amount', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: AppSizes.sm),
            GestureDetector(
              onTap: () {
                final x = controller.addOne(amount.value);
                amount.value = x;
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
