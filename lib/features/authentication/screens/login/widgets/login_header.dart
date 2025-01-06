import 'package:flutter/material.dart';
import 'package:pizza/utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSizes.sm,
        ),
        //app logo
        const Center(
            child: Image(height: 120, image: AssetImage(AppImages.pizzaLogo))),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          AppTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
      ],
    );
  }
}
