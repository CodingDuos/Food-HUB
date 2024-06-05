import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/padding.dart';
import 'package:foodhub/app/models/fooditem_model_class.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:foodhub/app/modules/foodhub_products/widgets/add_products.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';

class SubCategoryProducts extends StatelessWidget {
  const SubCategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return GridView.builder(
          shrinkWrap: true,
          itemCount: controller.fooditemsofSubcategoryList.length + 1,
          gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.calculateCrossAxisCount(context))),
          itemBuilder: (context, index) {
            return index == controller.fooditemsofSubcategoryList.length
                ? const AddProductsWidgets()
                : SubCategoryProductCardWidget(index: index);
          });
    });
  }
}

class SubCategoryProductCardWidget extends StatelessWidget {
  const SubCategoryProductCardWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return controller.fooditemsofSubcategoryList[index].subfoodItems != null
          ? Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  controller.setselectedSubProducts(
                      controller.fooditemsofSubcategoryList[index].name,
                      controller
                          .fooditemsofSubcategoryList[index].subfoodItems!);

                  controller.update();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Mycolors.backgroundcolor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 90, child: Image.asset('images/pizza.png')),
                      Text(controller.fooditemsofSubcategoryList[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Mycolors.primarycolor)),
                    ],
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (controller.basketfoodsList
                      .where((element) =>
                          element.name ==
                          controller.fooditemsofSubcategoryList[index].name)
                      .toList()
                      .isNotEmpty) {
                    controller.setModifiersSelect(
                        controller
                            .fooditemsofSubcategoryList[index].modifierList!,
                        controller.fooditemsofSubcategoryList[index].name);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Mycolors.backgroundcolor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      padding10,
                      SizedBox(
                          height: 90, child: Image.asset('images/pizza.png')),
                      Text(controller.fooditemsofSubcategoryList[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Mycolors.primarycolor)),
                      Text(
                          '\$${controller.fooditemsofSubcategoryList[index].amount.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Mycolors.primarycolor)),
                      padding10,
                      controller.basketfoodsList
                              .where((element) =>
                                  element.name ==
                                  controller
                                      .fooditemsofSubcategoryList[index].name)
                              .toList()
                              .isEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: GestureDetector(
                                onTap: () {
                                  FoodItem data = FoodItem(
                                      name: controller
                                          .fooditemsofSubcategoryList[index]
                                          .name,
                                      amount: controller
                                          .fooditemsofSubcategoryList[index]
                                          .amount,
                                      modifierList: [],
                                      quantity: controller
                                          .fooditemsofSubcategoryList[index]
                                          .quantity,
                                      category: controller
                                          .fooditemsofSubcategoryList[index]
                                          .category);
                                  controller.basketfoodsList.add(data);
                                  controller.setbasketlistselected();
                                  controller.setModifiersSelect(
                                      controller
                                          .fooditemsofSubcategoryList[index]
                                          .modifierList!,
                                      controller
                                          .fooditemsofSubcategoryList[index]
                                          .name);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Mycolors.primarycolor
                                            .withOpacity(0.50)),
                                    height: 35,
                                    child: const Center(
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Mycolors.primarycolor),
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          var data = controller.basketfoodsList
                                              .where((element) =>
                                                  element.name ==
                                                  controller
                                                      .fooditemsofSubcategoryList[
                                                          index]
                                                      .name)
                                              .toList()[0];
                                          var newqunatity = data.quantity - 1;

                                          if (newqunatity == 0) {
                                            controller.updateFoodItem(
                                                controller.basketfoodsList,
                                                controller
                                                    .fooditemsofSubcategoryList[
                                                        index]
                                                    .name, (foodItem) {
                                              foodItem.quantity =
                                                  1; // Update the quantity to 4
                                            });
                                            controller.basketfoodsList
                                                .remove(data);
                                          } else {
                                            controller.updateFoodItem(
                                                controller.basketfoodsList,
                                                controller
                                                    .fooditemsofSubcategoryList[
                                                        index]
                                                    .name, (foodItem) {
                                              foodItem.quantity =
                                                  newqunatity; // Update the quantity to 4
                                            });
                                          }
                                          controller.update();
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      controller.basketfoodsList
                                          .where((element) =>
                                              element.name ==
                                              controller
                                                  .fooditemsofSubcategoryList[
                                                      index]
                                                  .name)
                                          .toList()[0]
                                          .quantity
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          var data = controller.basketfoodsList
                                              .where((element) =>
                                                  element.name ==
                                                  controller
                                                      .fooditemsofSubcategoryList[
                                                          index]
                                                      .name)
                                              .toList()[0];
                                          var newqunatity = data.quantity + 1;
                                          controller.updateFoodItem(
                                              controller.basketfoodsList,
                                              controller
                                                  .fooditemsofSubcategoryList[
                                                      index]
                                                  .name, (foodItem) {
                                            foodItem.quantity =
                                                newqunatity; // Update the quantity to 4
                                          });
                                          controller.update();
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
