import 'package:e_com_app/common/widgets/shimmers/shimmer.dart';
import 'package:e_com_app/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class EBoxesShimmer extends StatelessWidget {
  const EBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ESizes.spaceBtwItems),
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ESizes.spaceBtwItems),
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
