import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/models/category_model_class.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:foodhub/app/modules/foodhub_products/widgets/add_products.dart';
import 'package:foodhub/app/modules/foodhub_products/widgets/sub_category_products.dart';
import 'package:foodhub/app/modules/foodhub_products/widgets/sub_products.dart';
import 'package:get/get.dart';

import 'products_card_widget.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(6),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: controller.itemsOfSUbProductsList.isNotEmpty
              ? const SubProductsView()
              : controller.fooditemsofSubcategoryList.isNotEmpty
                  ? const SubCategoryProducts()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.dynamicfoodItems.length + 1,
                      gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              controller.calculateCrossAxisCount(context))),
                      itemBuilder: (context, index) {
                        returnwidgets() {
                          if (index != controller.dynamicfoodItems.length) {
                            if (controller.dynamicfoodItems[index]
                                is CategoryModelClass) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.setselectedSubcatory(controller
                                        .dynamicfoodItems[index].category);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Mycolors.backgroundcolor),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.soup_kitchen,
                                          size: 50,
                                          color: controller
                                                      .subselectedcategoryname
                                                      .value ==
                                                  controller
                                                      .dynamicfoodItems[index]
                                                      .category
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                        Text(
                                          controller
                                              .dynamicfoodItems[index].category,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                              color: controller
                                                          .subselectedcategoryname
                                                          .value ==
                                                      controller
                                                          .dynamicfoodItems[
                                                              index]
                                                          .category
                                                  ? Colors.white
                                                  : Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              if (controller
                                      .dynamicfoodItems[index].subfoodItems !=
                                  null) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setselectedSubProducts(
                                          controller
                                              .dynamicfoodItems[index].name,
                                          controller.dynamicfoodItems[index]
                                              .subfoodItems);

                                      controller.update();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Mycolors.backgroundcolor),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 90,
                                              child: Image.asset(
                                                  'images/pizza.png')),
                                          Text(
                                              controller
                                                  .dynamicfoodItems[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                  color:
                                                      Mycolors.primarycolor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return ProductsCardWidget(index: index);
                            }
                          }
                        }

                        return index == controller.dynamicfoodItems.length
                            ? const AddProductsWidgets()
                            : returnwidgets();
                      }),
        ),
      );
    });
  }
}
