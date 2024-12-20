import 'package:e_com_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_com_app/util/constants/colors.dart';
import 'package:e_com_app/util/constants/sizes.dart';
import 'package:e_com_app/util/constants/text_strings.dart';
import 'package:e_com_app/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ETermsAndConditionCheckbox extends StatelessWidget {
  const ETermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(width: ESizes.spaceBtwItems),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: '${ETexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${ETexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? EColors.white : EColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? EColors.white : EColors.primary,
              )),
              TextSpan(text: '${ETexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: ETexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? EColors.white : EColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? EColors.white : EColors.primary,
              )),
            ]),
        ),
      ],
    );
  }
}