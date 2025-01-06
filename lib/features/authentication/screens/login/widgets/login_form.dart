import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_config/forgot_password.dart';
import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.LoginFormKey,
        child: Column(
          children: [
            //email field
            TextFormField(
              controller: controller.email,
              validator: (value) => MyValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.email,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnInputFields,
            ),
            //password field
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    MyValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.direct_right),
                    labelText: AppTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceBtnInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(AppTexts.rememberMe)
                  ],
                ),

                //forgot pass
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(AppTexts.forgotPassword)),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),

            //Sign In
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(AppTexts.signIn),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnItems,
            ),

            //Create Acc button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(AppTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtnSections,
            ),
          ],
        ));
  }
}
