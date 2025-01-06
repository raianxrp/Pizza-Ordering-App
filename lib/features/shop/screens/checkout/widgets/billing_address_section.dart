import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Raian Rahman', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppSizes.spaceBtnItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtnItems),
            Text('+880 696696969',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtnItems),
            Expanded(
              child: Text('Kallayanpur, Navana Garden, Dhaka',
                  style: Theme.of(context).textTheme.bodyMedium),
            )
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtnItems),
      ],
    );
  }
}
