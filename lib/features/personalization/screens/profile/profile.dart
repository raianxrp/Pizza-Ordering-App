import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/shimmers/shimmer_loader.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../controllers/user_controller.dart';
import 'widgets/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final user = LocalStorage.instance().readData('User');
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
                  Text('Profile',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : 'assets/user.png';
                      return controller.imageUploading.value
                          ? const ShimmerEffect(height: 80, width: 80)
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              //details
              const SizedBox(
                height: AppSizes.spaceBtnItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),

              ProfileMenu(
                  title: 'Name',
                  value: user['FullName'],
                  onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenu(
                  title: 'Username', value: user['Username'], onPressed: () {}),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),

              //Heading Personal Info
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),

              ProfileMenu(
                  title: 'User ID',
                  value: user['Id'],
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'E-mail', value: user['Email'], onPressed: () {}),
              ProfileMenu(
                  title: 'Phone Number',
                  value: user['PhoneNumber'],
                  onPressed: () {}),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileMenu(
                  title: 'Date of Birth',
                  value: '14 Oct 2004',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(
                height: AppSizes.spaceBtnItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
