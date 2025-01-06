import 'package:flutter/material.dart';
import 'package:pizza/features/shop/controllers/cart_controller.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Column(
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${controller.totalCartPrice.value}',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnItems / 2),

        //Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.9', style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnItems / 2),

        //Tax Feee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.9', style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnItems / 2),

        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${(controller.totalCartPrice.value + 13.8).toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ],
    );
  }
}
