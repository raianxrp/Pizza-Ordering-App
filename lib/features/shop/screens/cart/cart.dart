import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/common/widgets/loaders/loaders.dart';
import 'package:pizza/common/widgets/texts/product_price_text.dart';
import 'package:pizza/features/shop/controllers/cart_controller.dart';
import 'package:pizza/features/shop/screens/cart/widgets/also_bought.dart';
import 'package:pizza/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';
import 'widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total :',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Obx(() =>
                      ProductPriceText(price: '${controller.totalCartPrice()}'))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (controller.cartItems.isNotEmpty) {
                      Get.to(() => const CheckoutScreen());
                    } else {
                      MyLoaders.customToast(
                          message: 'Please Select Pizzas First!');
                    }
                  },
                  style: TextButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "CHECKOUT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
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
                Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
            Obx(
              () => controller.cartItems.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: AppSizes.spaceBtnSections,
                        ),
                        Image.asset(
                          'assets/empty-cart.png',
                          scale: 3,
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtnItems,
                        ),
                        Text(
                          'Your Cart is currently empty.',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtnItems,
                        ),
                        OutlinedButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Continue Browsing',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ))
                      ],
                    )
                  : SizedBox(
                      height: MyHelperFunctions.screenHeight(context) * 0.6,
                      width: double.infinity,
                      child: ListView.separated(
                          //shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, idx) => const SizedBox(
                                height: AppSizes.spaceBtnItems,
                              ),
                          itemCount: controller.cartItems.length +
                              controller.addOns.length,
                          itemBuilder: (context, idx) =>
                              idx >= controller.cartItems.length
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                            height: AppSizes.spaceBtnItems),
                                        Row(
                                          children: [
                                            Text(
                                              'Others also bought:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                            height: AppSizes.spaceBtnItems),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: AlsoBoughtTile(
                                            item: controller.addOns[idx -
                                                controller.cartItems.length],
                                          ),
                                        )
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CartItemTile(
                                        cartItem: controller.cartItems[idx],
                                      ),
                                    )),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
