import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),

        //Order
        child: Column(
          children: [
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
                Text('Orders',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
            const OrderListItems(),
          ],
        ),
      ),
    );
  }
}
