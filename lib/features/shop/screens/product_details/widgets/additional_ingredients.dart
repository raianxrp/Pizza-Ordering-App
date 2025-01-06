import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/features/shop/controllers/additional_ingredient_controller.dart';
import 'package:pizza/features/shop/models/cart_model.dart';
import 'package:pizza/features/shop/screens/product_details/widgets/additional_ingredients_tile.dart';
import 'package:pizza/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class AdditionalIngredients extends StatelessWidget {
  AdditionalIngredients(
      {super.key, required this.item, required this.updatePrice});

  CartItemModel item;
  RxInt updatePrice;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdditionalIngredientController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  Text('Additional Ingredients',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnSections,
              ),
              Obx(
                () => SizedBox(
                  height: MyHelperFunctions.screenHeight(context) * 0.9,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, idx) => const SizedBox(
                            height: AppSizes.spaceBtnItems,
                          ),
                      itemCount: controller.ingredients.length,
                      itemBuilder: (context, idx) => AdditionalIngredientsTile(
                            ingredient: controller.ingredients[idx].toJson(),
                            item: item,
                            updatePrice: updatePrice,
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
