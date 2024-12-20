import 'package:e_com_app/util/constants/colors.dart';
import 'package:e_com_app/util/constants/text_strings.dart';
import 'package:e_com_app/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EFormDivider extends StatelessWidget {
  const EFormDivider({super.key, required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? EColors.darkGrey: EColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? EColors.darkGrey: EColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}