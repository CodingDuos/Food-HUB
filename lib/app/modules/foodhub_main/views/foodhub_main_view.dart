import 'package:flutter/material.dart';
import 'package:foodhub/app/modules/foodhub_basket/views/foodhub_basket_view.dart';
import 'package:foodhub/app/modules/foodhub_categories/views/foodhub_categories_view.dart';
import 'package:foodhub/app/modules/foodhub_products/views/foodhub_products_view.dart';

import 'package:get/get.dart';

import '../controllers/foodhub_main_controller.dart';

class FoodhubMainView extends GetView<FoodhubMainController> {
  const FoodhubMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FoodHubMainBodyView());
  }
}

class FoodHubMainBodyView extends StatelessWidget {
  const FoodHubMainBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Row(
        children: [
          size.width > 1500
              ? SizedBox(
                  width: controller.basketwidgetwidth.value,
                  child: const FoodhubBasketView(),
                )
              : Container(),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: controller.categorieswidgetwidth.value,
            child: const FoodhubCategoriesView(),
          ),
          Expanded(child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double availableWidth = constraints.maxWidth;
            controller.setProductsWidgetSizeWidth(availableWidth);
            return const FoodhubProductsView();
          }))
        ],
      );
    });
  }
}


    //  showDialog(
    //               context: context,
    //               builder: (BuildContext context) {
    //                 return MyDialog(
    //                   onDataFromChild: onDataFromChild,
    //                 );
    //               },
    //             );