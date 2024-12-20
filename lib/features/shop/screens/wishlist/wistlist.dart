import 'package:e_com_app/common/widgets/appbar/appbar.dart';
import 'package:e_com_app/common/widgets/icons/e_circular_icon.dart';
import 'package:e_com_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_com_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_com_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_com_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:e_com_app/features/shop/controller/product/favourites_controller.dart';
import 'package:e_com_app/features/shop/screens/home/home.dart';
import 'package:e_com_app/navigation_menu.dart';
import 'package:e_com_app/util/constants/image_strings.dart';
import 'package:e_com_app/util/constants/sizes.dart';
import 'package:e_com_app/util/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: EAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ECircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),

          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {

                final emptyWidget = EAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: EImages.empty,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );

                const loader = EVerticalProductShimmer(itemCount: 6);
                final widget = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if (widget != null)  return widget;

                final products = snapshot.data!;
                return EGridLayout(
                    itemCount: products.length, itemBuilder: (_, index) => EProductCardVertical(product: products[index]));
              }
            ),
          ),
        ),
      ),
    );
  }
}

