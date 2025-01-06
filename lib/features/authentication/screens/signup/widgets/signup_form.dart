import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'term_conditions_checkbox.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signUPFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        MyValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: AppTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtnInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        MyValidator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: AppTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtnInputFields,
            ),

            //user
            TextFormField(
              validator: (value) =>
                  MyValidator.validateEmptyText('Username', value),
              controller: controller.username,
              decoration: const InputDecoration(
                  labelText: AppTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnInputFields,
            ),

            //email
            TextFormField(
              validator: (value) => MyValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnInputFields,
            ),

            //Phone no
            TextFormField(
              validator: (value) => MyValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnInputFields,
            ),

            //Password
            Obx(
              () => TextFormField(
                validator: (value) => MyValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),

            const TermsAndConditionsCheckBox(),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(AppTexts.createAccount),
                )),
          ],
        ));
  }
}
