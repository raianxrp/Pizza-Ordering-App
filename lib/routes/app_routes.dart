import 'package:get/get.dart';
import 'package:pizza/features/shop/screens/product_details/product_details.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/password_config/forgot_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.settings, page: () => const SettingScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(
        name: Routes.cart,
        page: () => CartScreen(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: Routes.userProfile,
        page: () => const ProfileScreen(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signup, page: () => const SignUpScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgotPassword, page: () => const ForgotPassword()),
  ];
}
