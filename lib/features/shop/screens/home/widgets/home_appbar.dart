import 'package:e_com_app/common/widgets/appbar/appbar.dart';
import 'package:e_com_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_com_app/features/personalization/controllers/user_controller.dart';
import 'package:e_com_app/common/widgets/shimmers/shimmer.dart';
import 'package:e_com_app/util/constants/colors.dart';
import 'package:e_com_app/util/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ETexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.grey)),
          Obx(() {
            if(controller.profileLoading.value) {
              return const EShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white));
            }
          },
          ),
        ],
      ),
      actions: const [
        ECartCounterIcon(iconColor: EColors.white, counterBgColor : EColors.black, counterTextColor: EColors.white),
      ],
    );
  }
}