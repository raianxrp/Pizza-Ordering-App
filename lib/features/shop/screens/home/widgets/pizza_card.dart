import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza/common/widgets/shimmers/shimmer_loader.dart';
import 'package:pizza/features/shop/controllers/cart_controller.dart';
import 'package:pizza/utils/constants/sizes.dart';
import 'package:pizza/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/loaders/loaders.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../models/cart_model.dart';
import '../../product_details/product_details.dart';

class PizzaCard extends StatelessWidget {
  const PizzaCard({
    super.key,
    required this.pizza,
  });

  final Map pizza;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    return Material(
      elevation: 0,
      color: dark ? AppColors.darkContainer : AppColors.lightContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Get.to(
              () => ProductDetailScreen(
                    pizza: pizza,
                  ),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 300));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: pizza['Name'],
                child: CachedNetworkImage(
                    imageUrl: pizza['Image'],
                    errorWidget: (context, url, error) =>
                        const ShimmerEffect(height: 150, width: 150),
                    placeholder: (context, url) => const Center(
                        child: ShimmerEffect(height: 150, width: 150)))),
            const SizedBox(height: AppSizes.xs),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: pizza['IsVeg'] ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        pizza['IsVeg'] ? "VEG" : "NON-VEG",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        pizza['Spicy'] == 1
                            ? "🌶️ BLAND"
                            : pizza['Spicy'] == 2
                                ? "🌶️ BALANCE"
                                : "🌶️ SPICY",
                        style: TextStyle(
                            color: pizza['Spicy'] == 1
                                ? Colors.green
                                : pizza['Spicy'] == 2
                                    ? Colors.orange
                                    : Colors.redAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                pizza['Name'],
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                pizza['Description'],
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$${pizza['Price'] - (pizza['Price'] * (pizza['Discount']) / 100)}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "\$${pizza['Price']}",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          final item = CartItemModel(
                              id: pizza['Id'],
                              image: pizza['Image'],
                              name: pizza['Name'],
                              price: pizza['Price'],
                              size: 8,
                              amount: 1,
                              additionalIngredients: []);

                          if (cartController.getProductQuantityInCart(item) >=
                              1) {
                            MyLoaders.customToast(
                                message: 'Already added to cart!');
                          } else {
                            cartController.addToCart(item.toJson());
                          }
                        },
                        icon: const Icon(CupertinoIcons.add_circled_solid))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
