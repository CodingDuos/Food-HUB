import 'package:flutter/material.dart';
import 'package:foodhub/app/constants/colorsconstants.dart';
import 'package:foodhub/app/modules/foodhub_main/controllers/foodhub_main_controller.dart';
import 'package:get/get.dart';

class ListviewCategoriesCards extends StatelessWidget {
  const ListviewCategoriesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodhubMainController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.selectedCategorylist.length + 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == controller.selectedCategorylist.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Mycolors.primarycolor.withOpacity(0.90),
                      borderRadius: BorderRadius.circular(12)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Add Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  controller.setselectCategory(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: controller.selectedCategorylist[index] == true
                          ? Mycolors.primarycolor.withOpacity(0.50)
                          : null,
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(Icons.dinner_dining,
                        color: controller.selectedCategorylist[index] == true
                            ? Colors.white
                            : Colors.grey),
                    title: Text(
                      'Sea Food Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.selectedCategorylist[index] == true
                              ? Colors.white
                              : Colors.grey),
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
