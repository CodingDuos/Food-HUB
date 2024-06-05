import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/models/category_model_class.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

class GridviewCategoriesCards extends StatelessWidget {
  const GridviewCategoriesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      List<CategoryModelClass> newcategorylist = controller.categorieslist
          .where((element) => element.parentCategory == '-')
          .toList();

      return GridView.builder(
          shrinkWrap: true,
          itemCount: newcategorylist.length + 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.categoriesPerRowItems.value),
          itemBuilder: (context, index) {
            int newindex = index - 1;
            if (newindex == 0 - 1) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  onTap: () {
                    controller.selectmodifiers.value = false;
                    controller.modifiersList.clear();
                    controller.itemsOfSUbProductsList.clear();
                    controller.fooditemsofSubcategoryList.clear();

                    controller.selectedSubcategoryname.value = '';
                    controller.setselectedcatory('');
                    controller.filterfooditems('');
                  },
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Mycolors.primarycolor.withOpacity(0.50),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.online_prediction_rounded,
                                  size: 30, color: Colors.white),
                              Text(
                                'All Products',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              );
            }

            if (newindex == controller.selectedCategorylist.length) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Mycolors.primarycolor.withOpacity(0.90),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'Add Category',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () {
                  controller.selectedItemforModifiers.value = '';
                  controller.selectedSubProducts.value = '';

                  controller.selectmodifiers.value = false;
                  controller.modifiersList.clear();
                  controller.itemsOfSUbProductsList.clear();
                  controller.fooditemsofSubcategoryList.clear();
                  controller.selectedSubcategoryname.value = '';
                  controller
                      .setselectedcatory(newcategorylist[newindex].category);
                  controller
                      .filterfooditems(newcategorylist[newindex].category);
                },
                child: Card(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: controller.selectedcategoryname.value ==
                                  newcategorylist[newindex].category
                              ? Mycolors.primarycolor.withOpacity(0.50)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.soup_kitchen,
                              size: 30,
                              color: controller.selectedcategoryname.value ==
                                      newcategorylist[newindex].category
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Text(
                              newcategorylist[newindex].category,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color:
                                      controller.selectedcategoryname.value ==
                                              newcategorylist[newindex].category
                                          ? Colors.white
                                          : Colors.grey),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            );
          });
    });
  }
}
