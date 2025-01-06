import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/common/widgets/loaders/loaders.dart';
import 'package:pizza/features/shop/controllers/cart_controller.dart';
import 'package:pizza/features/shop/models/cart_model.dart';
import 'package:pizza/features/shop/screens/product_details/widgets/additional_ingredients.dart';
import 'package:pizza/features/shop/screens/product_details/widgets/ingredients.dart';
import 'package:pizza/utils/constants/colors.dart';
import 'package:pizza/utils/constants/sizes.dart';
import 'package:pizza/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/icons/circular_icon.dart';
import 'widgets/macro.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.pizza});

  final Map pizza;
  RxInt size = 8.obs;
  RxInt amount = 1.obs;
  RxInt updatePrice = 0.obs;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());
    final item = CartItemModel(
      id: pizza['Id'],
      image: pizza['Image'],
      name: pizza['Name'],
      price: pizza['Price'],
      size: size.value,
      amount: amount.value,
      additionalIngredients: [],
    );

    return Scaffold(
      backgroundColor: dark ? AppColors.black : AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                          boxShadow: [
                            BoxShadow(
                                color:
                                    dark ? AppColors.darkerGrey : Colors.grey,
                                offset: const Offset(2, 2),
                                blurRadius: 3)
                          ],
                          color: dark ? AppColors.dark : Colors.white),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          iconSize: AppSizes.lg,
                          icon: const Icon(Iconsax.arrow_left_2)),
                    ),
                  ),
                  Text('Details',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    dark ? AppColors.darkerGrey : Colors.grey,
                                offset: const Offset(2, 2),
                                blurRadius: 3)
                          ],
                          color: dark ? AppColors.dark : Colors.white),
                      child: IconButton(
                          onPressed: () => Get.toNamed('/cart'),
                          iconSize: AppSizes.lg,
                          icon: const Icon(Iconsax.shopping_bag)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtnSections),
              Row(
                children: [
                  Column(
                    children: [
                      const Ingredients(
                          name: 'Tomato',
                          path: 'assets/ingredients/tomato.png'),
                      const SizedBox(height: AppSizes.spaceBtnItems),
                      const Ingredients(
                          name: 'Basil', path: 'assets/ingredients/basil.png'),
                      const SizedBox(height: AppSizes.spaceBtnItems),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AdditionalIngredients(
                                item: item,
                                updatePrice: updatePrice,
                              ));
                        },
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: dark
                                          ? AppColors.darkerGrey
                                          : Colors.grey,
                                      offset: const Offset(2, 2),
                                      blurRadius: 3)
                                ],
                                color: dark ? AppColors.dark : Colors.white),
                            child: const Icon(Iconsax.add)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Hero(
                      tag: pizza['Name'],
                      child: CachedNetworkImage(
                        imageUrl: pizza['Image'],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(pizza['Name'],
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              ReadMoreText(
                pizza['Description'] ?? '',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Less',
                textAlign: TextAlign.start,
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              Row(
                children: [
                  MyMacroWidget(
                    title: "Calories",
                    value: pizza['Macros']['Calories'],
                    icon: FontAwesomeIcons.fire,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyMacroWidget(
                    title: "Protein",
                    value: pizza['Macros']['Protein'],
                    icon: FontAwesomeIcons.dumbbell,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyMacroWidget(
                    title: "Fat",
                    value: pizza['Macros']['Fat'],
                    icon: Iconsax.milk,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyMacroWidget(
                    title: "Carbs",
                    value: pizza['Macros']['Carbs'],
                    icon: FontAwesomeIcons.breadSlice,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => updatePrice.value >= 0
                            ? Text(
                                "\$${((pizza['Price'] - (pizza['Price'] * (pizza['Discount']) / 100)) + (item.additionalIngredients.length * 1.99)).toStringAsFixed(2)}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                            : Text(
                                "\$${((pizza['Price'] - (pizza['Price'] * (pizza['Discount']) / 100)) + (item.additionalIngredients.length * 1.99)).toStringAsFixed(2)}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "\$${pizza['Price']}",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: dark ? AppColors.darkerGrey : Colors.grey,
                              offset: const Offset(2, 2),
                              blurRadius: 3)
                        ],
                        color: dark ? AppColors.dark : Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // boxShadow: const [
                              //   BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 2)
                              // ],
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 3),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (amount.value > 1) {
                                      amount.value--;
                                      item.amount = amount.value;
                                    }
                                  },
                                  child: CircularIcon(
                                    icon: Iconsax.minus,
                                    width: 32,
                                    height: 32,
                                    size: AppSizes.md,
                                    color: dark
                                        ? AppColors.white
                                        : AppColors.black,
                                    backgroundColor: dark
                                        ? AppColors.darkerGrey
                                        : AppColors.light,
                                  ),
                                ),
                                const SizedBox(width: AppSizes.sm),
                                Text('${amount.value}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                const SizedBox(width: AppSizes.sm),
                                GestureDetector(
                                  onTap: () {
                                    amount.value++;
                                    item.amount = amount.value;
                                  },
                                  child: const CircularIcon(
                                    icon: Iconsax.add,
                                    width: 32,
                                    height: 32,
                                    size: AppSizes.iconSm,
                                    color: AppColors.white,
                                    backgroundColor: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              Row(
                children: [
                  Text(
                    'Size',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 2)
                    ],
                  ),
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              size.value = 8;
                              item.size = size.value;
                            },
                            child: Container(
                              height: 30,
                              width: 40,
                              decoration: BoxDecoration(
                                color: size.value == 8
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '8"',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: size.value == 8
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              size.value = 10;
                              item.size = size.value;
                            },
                            child: Container(
                              height: 30,
                              width: 40,
                              decoration: BoxDecoration(
                                color: size.value == 10
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '10"',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: size.value == 10
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              size.value = 12;
                              item.size = size.value;
                            },
                            child: Container(
                              height: 30,
                              width: 40,
                              decoration: BoxDecoration(
                                color: size.value == 12
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '12"',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: size.value == 12
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtnSections * 2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    log(item.additionalIngredients.length.toString());
                    if (controller.getProductQuantityInCart(item) >= 1) {
                      MyLoaders.customToast(message: 'Already added to cart!');
                    } else {
                      item.price = ((pizza['Price'] -
                              (pizza['Price'] * (pizza['Discount']) / 100)) +
                          (item.additionalIngredients.length * 1.99));
                      controller.addToCart(item.toJson());
                    }
                  },
                  style: TextButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Add to cart",
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
    );
  }
}
