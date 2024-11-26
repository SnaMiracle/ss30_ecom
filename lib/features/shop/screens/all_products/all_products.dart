import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_app/common/widgets/appbar/appbar.dart';
import 'package:e_com_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_com_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:e_com_app/features/shop/controller/all_products_controller.dart';
import 'package:e_com_app/features/shop/models/product_model.dart';
import 'package:e_com_app/util/constants/sizes.dart';
import 'package:e_com_app/util/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});
  
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: EAppBar(title: Text(title), showBackArrow: true),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {

                const loader = EVerticalProductShimmer();
                final widget = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                if (widget != null) return widget;

                final products = snapshot.data!;

                return ESortableProducts(products: products);
              }
          ),
        ),
      ),
    );
  }
}