import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/constants/font_manager.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';

import 'package:get/get.dart';

class ModifiersGridView extends StatelessWidget {
  const ModifiersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: controller.modifiersList.length + 1,
              gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.calculateCrossAxisCount(context))),
              itemBuilder: (context, index) {
                return index == controller.modifiersList.length
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: DottedBorder(
                          color: Mycolors.primarycolor,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(4),
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Mycolors.primarycolor,
                                      size: MyFonts.size87,
                                    ),
                                  ],
                                ),
                                Text('Add Modifiers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: Mycolors.primarycolor))
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.updateFoodItem(
                                controller.basketfoodsList,
                                controller.selectedItemforModifiers.value,
                                (foodItem) {
                              bool datacheck = foodItem.modifierList!
                                  .where((element) =>
                                      element.name ==
                                      controller.modifiersList[index].name)
                                  .toList()
                                  .isEmpty;

                              if (datacheck) {
                                foodItem.modifierList!
                                    .add(controller.modifiersList[index]);
                              } else {
                                controller.updateModifersQunatity(
                                    foodItem.modifierList!,
                                    controller.modifiersList[index].name,
                                    (modifieritem) {
                                  modifieritem.qunatity =
                                      modifieritem.qunatity + 1;
                                });
                              }
                            });
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
                                    height: 90,
                                    child: Image.asset('images/pizza.png')),
                                Text(controller.modifiersList[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: Mycolors.primarycolor)),
                                Text(
                                    '\$${controller.modifiersList[index].amount.toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: Mycolors.primarycolor)),
                              ],
                            ),
                          ),
                        ),
                      );
              }),
        ),
      );
    });
  }
}
