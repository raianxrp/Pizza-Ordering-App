import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title
              const LoginHeader(),

              //Form
              const LoginForm(),

              //Divider
              FormDivider(
                dividerText: AppTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                height: AppSizes.spaceBtnSections,
              ),

              //Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
