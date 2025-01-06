import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/features/personalization/controllers/address_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return GestureDetector(
      onTap: () => controller.selectAddressPopup(context),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 2)
            ],
          ),
          child: Row(
            children: [
              Stack(alignment: Alignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadiusLg),
                    child: Image.asset(
                      'assets/random_map.jpg',
                      width: 140,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.white,
                  ),
                  child: const Icon(
                    Iconsax.location5,
                    color: Colors.black,
                  ),
                )
              ]),
              const SizedBox(width: AppSizes.spaceBtnItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSizes.sm,
                  ),
                  Text(
                    'Home',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      '82356 Timmy Coves, South Liana, Maine, 87665, USA',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      //softWrap: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
