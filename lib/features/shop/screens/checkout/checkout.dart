import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/common/widgets/texts/section_heading.dart';
import 'package:pizza/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/cart_controller.dart';
import 'widgets/address_card.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
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
                  Text('Order Review',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnSections,
              ),
              const SectionHeading(
                title: 'Address',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtnItems),
              const AddressCard(),
              const SizedBox(height: AppSizes.spaceBtnSections),
              const CouponCode(),
              const SizedBox(height: AppSizes.spaceBtnSections),
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    //Pricing
                    BillingAmountSection(),

                    SizedBox(height: AppSizes.spaceBtnItems),

                    //Divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtnItems),

                    //Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtnItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoundedContainer(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextButton(
              onPressed: () => Get.to(() => SuccessScreen(
                    image: AppImages.successfulPaymentIcon,
                    title: 'Congratulations!!',
                    subtitle: 'Your order has been placed',
                    onPressed: () {
                      controller.clearCart();
                      Get.offAll(() => const NavigaitionMenu());
                    },
                  )),
              style: TextButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "Order and Pay",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )),
    );
  }
}
