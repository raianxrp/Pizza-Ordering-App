import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/features/personalization/controllers/notification_controller.dart';
import 'package:pizza/features/personalization/screens/address/address.dart';
import 'package:pizza/features/personalization/screens/coupon/coupon_screen.dart';
import 'package:pizza/features/shop/screens/cart/cart.dart';

import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/order/order.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(NotificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSizes.spaceBtnSections,
                  ),
                  //Account Settings
                  const SectionHeading(
                    title: 'Manage Account',
                    showActionButton: false,
                  ),
                  UserProfileTile(
                    onPressed: () => Get.toNamed('/user-profile'),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtnItems,
                  ),
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set Shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => CartScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                    onTap: () => Get.to(() => const CouponScreen()),
                  ),
                  Obx(
                    () => SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Turn on or off notification message',
                      trailing: Switch(
                          value: notificationController.sendNotifications.value,
                          onChanged:
                              notificationController.toggleNotifications),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtnSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtnSections * 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
