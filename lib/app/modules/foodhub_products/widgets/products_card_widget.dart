import 'package:flutter/material.dart';
import 'package:foodhub/app/models/fooditem_model_class.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

import '../../../constants/colorsconstants.dart';
import '../../../constants/padding.dart';

class ProductsCardWidget extends StatelessWidget {
  const ProductsCardWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            if (controller.basketfoodsList
                .where((element) =>
                    element.name == controller.dynamicfoodItems[index].name)
                .toList()
                .isNotEmpty) {
              controller.setModifiersSelect(
                  controller.dynamicfoodItems[index].modifierList,
                  controller.dynamicfoodItems[index].name);
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
                SizedBox(height: 90, child: Image.asset('images/pizza.png')),
                Text(controller.dynamicfoodItems[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Mycolors.primarycolor)),
                Text(
                    '\$${controller.dynamicfoodItems[index].amount.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Mycolors.primarycolor)),
                padding10,
                controller.basketfoodsList
                        .where((element) =>
                            element.name ==
                            controller.dynamicfoodItems[index].name)
                        .toList()
                        .isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: GestureDetector(
                          onTap: () {
                            FoodItem data = FoodItem(
                                name: controller.dynamicfoodItems[index].name,
                                amount:
                                    controller.dynamicfoodItems[index].amount,
                                modifierList: [],
                                quantity:
                                    controller.dynamicfoodItems[index].quantity,
                                category: controller
                                    .dynamicfoodItems[index].category);
                            controller.basketfoodsList.add(data);
                            controller.setbasketlistselected();
                            controller.setModifiersSelect(
                                controller.dynamicfoodItems[index].modifierList,
                                controller.dynamicfoodItems[index].name);

                            // controller.update();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      Mycolors.primarycolor.withOpacity(0.50)),
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
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Mycolors.primarycolor),
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    var data = controller.basketfoodsList
                                        .where((element) =>
                                            element.name ==
                                            controller
                                                .dynamicfoodItems[index].name)
                                        .toList()[0];
                                    var newqunatity = data.quantity - 1;

                                    if (newqunatity == 0) {
                                      controller.updateFoodItem(
                                          controller.basketfoodsList,
                                          controller.dynamicfoodItems[index]
                                              .name, (foodItem) {
                                        foodItem.quantity =
                                            1; // Update the quantity to 4
                                      });
                                      controller.basketfoodsList.remove(data);
                                    } else {
                                      controller.updateFoodItem(
                                          controller.basketfoodsList,
                                          controller.dynamicfoodItems[index]
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
                                        controller.dynamicfoodItems[index].name)
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
                                                .dynamicfoodItems[index].name)
                                        .toList()[0];
                                    var newqunatity = data.quantity + 1;
                                    controller.updateFoodItem(
                                        controller.basketfoodsList,
                                        controller.dynamicfoodItems[index].name,
                                        (foodItem) {
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
