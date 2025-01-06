import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pizza/utils/local_storage/storage_utility.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../images/circular_image.dart';
import '../shimmers/shimmer_loader.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final user = LocalStorage.instance().readData('User');
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image =
            networkImage.isNotEmpty ? networkImage : 'assets/user.png';
        return controller.imageUploading.value
            ? const ShimmerEffect(height: 50, width: 50)
            : CircularImage(
                image: image,
                width: 50,
                height: 50,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(user['FirstName'],
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.black)),
      subtitle: Text(user['Email'],
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.black)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: AppColors.black),
      ),
    );
  }
}
