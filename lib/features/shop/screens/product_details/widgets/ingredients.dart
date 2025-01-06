import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.path, required this.name});

  final String path;
  final String name;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: dark ? AppColors.darkerGrey : Colors.grey,
                offset: const Offset(2, 2),
                blurRadius: 3)
          ],
          color: dark ? AppColors.dark : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(
              path,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          )
        ],
      ),
    );
  }
}
