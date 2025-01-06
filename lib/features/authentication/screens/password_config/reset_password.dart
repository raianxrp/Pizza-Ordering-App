import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/forgot_password/forgot_password_controller.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //iconTheme: IconThemeData(
        //  color: dark ? AppColors.white : AppColors.black,
        //),
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.clear,
                color: dark ? AppColors.white : AppColors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            //Image
            Image(
              image: const AssetImage(AppImages.deliveredEmailIllustration),
              width: MyHelperFunctions.screenWidth(context) * 0.6,
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
            Text(
              AppTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppSizes.spaceBtnItems,
            ),
            Text(
              AppTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(AppTexts.done)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgotPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(AppTexts.resendEmail)),
            ),
          ]),
        ),
      ),
    );
  }
}
