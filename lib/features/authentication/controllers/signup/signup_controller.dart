import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUPFormKey = GlobalKey<FormState>();

  //SignUp
  void signup() async {
    try {
      //form validation
      if (!signUPFormKey.currentState!.validate()) {
        //FullScreenLoader.stopLoading();
        return;
      }
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //FullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        MyLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must read and accept the Privacy Policy and Terms of Use');
        return;
      }

      FullScreenLoader.openLoadingDialog(
          'We are processing your information', AppImages.docerAnimation);

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);

      MyLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Account has been created! Verify email to continue.');
      FullScreenLoader.stopLoading();

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
