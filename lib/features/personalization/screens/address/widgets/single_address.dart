import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: RoundedContainer(
            padding: const EdgeInsets.all(AppSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress
                ? AppColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : dark
                    ? AppColors.darkerGrey
                    : AppColors.grey,
            margin: const EdgeInsets.only(bottom: AppSizes.spaceBtnItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? dark
                            ? AppColors.light
                            : AppColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(address.formattedPhoneNo,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                        //'82356 Timmy Coves, South Liana, Maine, 87665, USA',
                        address.toString(),
                        softWrap: true)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
