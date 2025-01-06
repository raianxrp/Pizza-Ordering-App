import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: MyAppBar(
          showBackArrow: true,
          title: Text(
            'Re-Authenticate User',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: MyValidator.validateEmail,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: AppTexts.email),
                  ),
                  const SizedBox(height: AppSizes.spaceBtnInputFields),
                  Obx(() => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            MyValidator.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: AppTexts.email,
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: controller.hidePassword.value
                                    ? const Icon(Iconsax.eye_slash)
                                    : const Icon(Iconsax.eye))),
                      )),
                  const SizedBox(height: AppSizes.spaceBtnSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.reAuthEmailAndPassword(),
                      child: const Text('Verify'),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
