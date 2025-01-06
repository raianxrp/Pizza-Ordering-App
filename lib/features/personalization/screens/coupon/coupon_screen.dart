import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 3)
                    ],
                    color: Colors.white),
                child: IconButton(
                    onPressed: () => Get.back(),
                    iconSize: AppSizes.lg,
                    icon: const Icon(Iconsax.arrow_left_2)),
              ),
            ),
            Text('Coupons', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(
              width: 40,
            )
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnSections * 2),
        Center(
          child: Image.asset(height: 200, width: 200, AppImages.couponGif),
        ),
        const SizedBox(height: AppSizes.spaceBtnSections),
        Text(
          'No Coupons Available.',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ]),
    ));
  }
}
