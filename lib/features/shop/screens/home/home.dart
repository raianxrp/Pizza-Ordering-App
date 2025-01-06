import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pizza/features/shop/controllers/pizza_controller.dart';
import 'package:pizza/utils/constants/sizes.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import 'widgets/pizza_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PizzaController());
    // final dark = MyHelperFunctions.isDarkMode(context);
    final pizzas = controller.pizzas;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            children: [
              Image.asset('assets/pizzas/8.png', scale: 14),
              const SizedBox(width: 8),
              Text(
                'PIZZA',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
          actions: [
            CartCounterIcon(onPressed: () => Get.toNamed('/cart')),
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: Icon(Iconsax.login,
                    color: Theme.of(context).iconTheme.color)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 9 / 16,
              ),
              itemCount: controller.pizzas.length,
              itemBuilder: (context, idx) {
                return PizzaCard(pizza: pizzas[idx].toJson());
              },
            ),
          ),
        ));
  }
}
