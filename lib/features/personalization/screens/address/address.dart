import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () => Get.to(() => const AddNewAddress()),
          child: const Icon(Iconsax.add, color: AppColors.white)),
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
                  Text('Addresses',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtnSections,
              ),
              Obx(
                () => FutureBuilder(
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.allUserAddresses(),
                    builder: (context, snapshot) {
                      final widget = CloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot);
                      if (widget != null) return widget;
                      final addresses = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (context, index) => SingleAddress(
                          address: addresses[index],
                          onTap: () =>
                              controller.selectAddress(addresses[index]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
