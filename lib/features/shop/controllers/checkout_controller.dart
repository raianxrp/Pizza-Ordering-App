import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../models/payment_method_model.dart';
import '../screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: AppImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtnSections),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: AppImages.paypal)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: AppImages.googlePay)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: AppImages.applePay)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Visa', image: AppImages.visa)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: AppImages.masterCard)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paytm', image: AppImages.paytm)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: AppImages.paystack)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: AppImages.creditCard)),
              const SizedBox(height: AppSizes.spaceBtnSections / 2),
            ],
          ),
        ),
      ),
    );
  }
}
